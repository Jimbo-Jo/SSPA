# SSPA
A fast and gridless single target DOA estimation algorithm under the multi-frequency model

The code for "Fast Gridless DOA Estimation with Multiple Frequencies Using Synthetic Sparse Planar Array".

We use a synthetic sparse planar array to characterize the multi-frequency model, and then transform the DOA estimation problem into a matrix completion problem, which can be effectively solved using the Funk-SVD algorithm. Our experimental results demonstrate that the algorithm overcomes grid mismatch and greatly improves running speed. However, SSPA has the limitation that it is only applicable under single-target conditions.

Actually, it was just a flash of insight while I was reading the literature. I put it into realization and discovered its limitations through analysis and experiments. In conclusion, it was a failed but meaningful try.

If there are some questions or errors, please contact jianbojiao@zju.edu.cn
