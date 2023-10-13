-- SQL script that creates a stored procedure ComputeAverageScoreForUser that computes
-- and store the average score for a student. Note: An average score can be a decimal
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE score_count INT;

    -- Initialize total_score and score_count
    SET total_score = 0;
    SET score_count = 0;

    -- Calculate the total score for the user
    SELECT SUM(score) INTO total_score
    FROM corrections
    WHERE user_id = user_id;

    -- Count the number of corrections
    SELECT COUNT(*) INTO score_count
    FROM corrections
    WHERE user_id = user_id;

    -- Compute the average score (avoid division by zero)
    IF score_count > 0 THEN
        SET total_score = total_score / score_count;
    ELSE
        SET total_score = 0;
    END IF;

    -- Update the average_score for the user
    UPDATE users
    SET average_score = total_score
    WHERE id = user_id;
END $$

DELIMITER ;