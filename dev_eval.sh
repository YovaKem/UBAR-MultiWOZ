
for e in 43 45 ; do
  path=./experiments/localbase-2.2/epoch${e}_trloss0.56_gpt2/
  python train.py -mode test -cfg eval_load_path=$path use_true_prev_bspn=False use_true_prev_aspn=False use_true_db_pointer=False use_true_prev_resp=False use_true_curr_bspn=False use_true_curr_aspn=False use_all_previous_context=True cuda_device=0 use_true_bspn_for_ctr_eval=False >> dev_eval.out
done

for e in 47 49 ; do
  path=./experiments/localbase-2.2/epoch${e}_trloss0.55_gpt2/
  python train.py -mode test -cfg eval_load_path=$path use_true_prev_bspn=False use_true_prev_aspn=False use_true_db_pointer=False use_true_prev_resp=False use_true_curr_bspn=False use_true_curr_aspn=False use_all_previous_context=True cuda_device=0 use_true_bspn_for_ctr_eval=False >> dev_eval.out
done

for e in 51 53 55 ; do
  path=./experiments/localbase-2.2/epoch${e}_trloss0.54_gpt2/
  python train.py -mode test -cfg eval_load_path=$path use_true_prev_bspn=False use_true_prev_aspn=False use_true_db_pointer=False use_true_prev_resp=False use_true_curr_bspn=False use_true_curr_aspn=False use_all_previous_context=True cuda_device=0 use_true_bspn_for_ctr_eval=False >> dev_eval.out
done

for e in 57 59 ; do
  path=./experiments/localbase-2.2/epoch${e}_trloss0.53_gpt2/
  python train.py -mode test -cfg eval_load_path=$path use_true_prev_bspn=False use_true_prev_aspn=False use_true_db_pointer=False use_true_prev_resp=False use_true_curr_bspn=False use_true_curr_aspn=False use_all_previous_context=True cuda_device=0 use_true_bspn_for_ctr_eval=False >> dev_eval.out
done
