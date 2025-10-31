Return-Path: <linux-mips+bounces-11982-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A3AC23263
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 04:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33CF11A6375A
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 03:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99ED9244671;
	Fri, 31 Oct 2025 03:19:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7019CD06;
	Fri, 31 Oct 2025 03:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761880776; cv=none; b=X8ZG5BYv+jp4JiRRs5iXBALmYSLZMGggmFqKUcNokiZWG3Y+c3LXoQJ8ry55sZ2ryDu+65Yux4F//rVdYXcjNnXleFLlpTW7K3IXrbPMrSW8ot82LlsWURP1Zef/DjXAXt43upnz7fr4LkBMN1+RaXf2WFcNmcJzg4/JAEsKMU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761880776; c=relaxed/simple;
	bh=/pA8Cx3cIYaJ42EnJWXYvyj/GTZHkR43Gs38seuSImQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=SHoji4L67QFKFykQfgICie4kDW4PW00K+2dUKaSBoTpZ88xIOWsLbEIr0FkDuJ4fhtKkjaKTdnHnqMorpul1G5Ofzp2VYWywQ6AleSBOk86Gk1MEKBtOx4VVFqh9V6XeSgHJdXRVs638eA+8zf8wh6VGlGT56FKP33EhhiAiiy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in01.mta.xmission.com ([166.70.13.51]:44202)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1vEffh-00CIIj-Pq; Thu, 30 Oct 2025 21:19:25 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:40500 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1vEffg-00AO1m-PE; Thu, 30 Oct 2025 21:19:25 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mips@vger.kernel.org,  Huacai Chen <chenhuacai@kernel.org>,
  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Jinyang He
 <hejinyang@loongson.cn>,  Thomas =?utf-8?Q?Bogend=C3=B6rfer?=
 <tsbogend@alpha.franken.de>,
  Youling Tang <tangyouling@loongson.cn>,  LKML
 <linux-kernel@vger.kernel.org>,  kernel-janitors@vger.kernel.org,
  Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <037fcb01-b723-42f3-b3e8-9a351e1caa47@web.de> (Markus Elfring's
	message of "Thu, 30 Oct 2025 20:57:29 +0100")
References: <037fcb01-b723-42f3-b3e8-9a351e1caa47@web.de>
Date: Thu, 30 Oct 2025 22:19:20 -0500
Message-ID: <877bwb21xj.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1vEffg-00AO1m-PE;;;mid=<877bwb21xj.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX19S3CM5cmj+YGCn2gcBppJHelujFYlsSqg=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4888]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa04 1397; Body=1 Fuz1=1 Fuz2=1]
	*  1.0 T_XMDrugObfuBody_08 obfuscated drug references
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa04 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Markus Elfring <Markus.Elfring@web.de>
X-Spam-Relay-Country: 
X-Spam-Timing: total 449 ms - load_scoreonly_sql: 0.53 (0.1%),
	signal_user_changed: 16 (3.6%), b_tie_ro: 13 (2.8%), parse: 1.89
	(0.4%), extract_message_metadata: 5 (1.2%), get_uri_detail_list: 1.98
	(0.4%), tests_pri_-2000: 6 (1.3%), tests_pri_-1000: 4.7 (1.1%),
	tests_pri_-950: 2.2 (0.5%), tests_pri_-900: 1.62 (0.4%),
	tests_pri_-90: 67 (14.9%), check_bayes: 64 (14.3%), b_tokenize: 11
	(2.4%), b_tok_get_all: 7 (1.6%), b_comp_prob: 3.2 (0.7%),
	b_tok_touch_all: 38 (8.5%), b_finish: 1.07 (0.2%), tests_pri_0: 322
	(71.6%), check_dkim_signature: 1.09 (0.2%), check_dkim_adsp: 5 (1.2%),
	poll_dns_idle: 1.16 (0.3%), tests_pri_10: 2.1 (0.5%), tests_pri_500: 8
	(1.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] MIPS: Loongson64: Use pointer from memcpy() call for
 assignment in loongson_kexec_prepare()
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: linmq006@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, tangyouling@loongson.cn, tsbogend@alpha.franken.de, hejinyang@loongson.cn, jiaxun.yang@flygoat.com, chenhuacai@kernel.org, linux-mips@vger.kernel.org, Markus.Elfring@web.de
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

Markus Elfring <Markus.Elfring@web.de> writes:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 30 Oct 2025 20:48:11 +0100
>
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.
>
> The source code was transformed by using the Coccinelle software.

Just looking at this change, I think this obscures things more than
clarifies things.

I believe the separate variable was used as much as anything to make
the line lengths shorter and the code more readable.

Eric


> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/mips/loongson64/reset.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> index 3e20ade0503a..ce412f5616b7 100644
> --- a/arch/mips/loongson64/reset.c
> +++ b/arch/mips/loongson64/reset.c
> @@ -76,8 +76,9 @@ static int loongson_kexec_prepare(struct kimage *image)
>  			 * of parameters (as bootloader does).
>  			 */
>  			int offt;
> -			str = (char *)argv + KEXEC_ARGV_SIZE/2;
> -			memcpy(str, image->segment[i].buf, KEXEC_ARGV_SIZE/2);
> +
> +			str = memcpy((char *)argv + KEXEC_ARGV_SIZE / 2, image->segment[i].buf,
> +				     KEXEC_ARGV_SIZE / 2);
>  			ptr = strchr(str, ' ');
>  
>  			while (ptr && (argc < MAX_ARGS)) {

