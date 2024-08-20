Return-Path: <linux-mips+bounces-4976-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E72B8958C0F
	for <lists+linux-mips@lfdr.de>; Tue, 20 Aug 2024 18:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 951B9285333
	for <lists+linux-mips@lfdr.de>; Tue, 20 Aug 2024 16:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF984D8AD;
	Tue, 20 Aug 2024 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="aSbq/6te"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77747208D7
	for <linux-mips@vger.kernel.org>; Tue, 20 Aug 2024 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724170632; cv=none; b=fgoKz6jyqYoxQA4x5CPIhDE1e6WQRXsx9rZZFIW9i9M72UqPzme8RNIqSiUuGk/wLL5pz+A/OI32LD1t6gKieCjNcCrsE1hUFDtFdxBxhhmKB3PCxLjT5f3zzBCaIWHiOzp88hhzGU3ozjLyarlrSC00VaDLZnRK6j7/nJ7x31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724170632; c=relaxed/simple;
	bh=VMVT4o/viJ+SB8e1RxOpvakPxiWRAPlw1XUAGla3BvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKDOdzwstuG4JgRRHX5ZMZIBTlybhJL4DTvNkju26QKRNzmC5aCTMHzKS2MKK6OuD/rPp2Nu2y6V6zWykoM4zWRiEYzcA3WFYwVA+MGGaz0LLV/R/jZHBw5AjbFlIqzTUBC7aPjLeUrh/2Z6HpGH2m35szsQLyGPKa8AWas0mWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=aSbq/6te; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-713dc00ce9dso2831843b3a.0
        for <linux-mips@vger.kernel.org>; Tue, 20 Aug 2024 09:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724170630; x=1724775430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3RB98ZInRLKc4ZeYz6+DAd/u6XvyF4MvP9+GjpqnzbE=;
        b=jl9aO2LdOfajnSov2GC4cXVzF2AyDjvSMcSIugRC8iaV8HIwTQOwDd9l89FAEk62/E
         h4sJgJkWOXDXl/l7+ANd4s7X+IVBXzrHLn807y/+6Fq9S2B16bLEm7XyqEQx1L0otS5+
         CoiiyYnhN/WY17r+ySZQh65vG7uB29maCKh+RRMrpaTZyt6AaKE/xkCeLjvgYApFhHDn
         rCDYjbwa8yqgeyLUhFr0EoX+xJnHDs2U750agmeYcaluhG0CTelXfNp2z4Fufru9pyLm
         QVJx3aScwa71R/6xgleBB0YLs+/yqmPmOZWDCuT/1gEgNgpA3b1c2Rex5r055UzK/WsU
         cRZg==
X-Forwarded-Encrypted: i=1; AJvYcCVmx2kqVoKH0OhzewLWhapBLAzMj09NW9jwo90Qp19nMyt0LlNADEeIG6y7lglgUqX13QL6jSIN+xLDoFQbaMAzMaRPCM6YWzGmcA==
X-Gm-Message-State: AOJu0YzBGrhTV3Nsc1EFy+XslhZbhmWq7B+g1UX8h5iz7M3Q9yc7XJ41
	FTXeqRotJ+WIOVZzVfqBn3n3UGxSg1ZL07fP3G972Y+s+jj0kk1L
X-Google-Smtp-Source: AGHT+IFImw0p9BawFBMudUMmIvZCVsiH5u9CUXsiX1BuWucxyr8NG7g7F8JPIJ5r/Py08hzy9YvO5w==
X-Received: by 2002:a05:6a00:139c:b0:714:1311:cd24 with SMTP id d2e1a72fcca58-7141311d15fmr2004486b3a.5.1724170629649;
        Tue, 20 Aug 2024 09:17:09 -0700 (PDT)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aefa113sm8662847b3a.99.2024.08.20.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marliere.net; s=2024;
	t=1724170626; bh=VMVT4o/viJ+SB8e1RxOpvakPxiWRAPlw1XUAGla3BvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aSbq/6teIbLWj8EsyY1zenhVBhzT/pW2hmqjtqxNKNm6hftA0R84KUxSAh2lgew3B
	 AmJqCLfFcbhWH6kiMe8envsgMPjpxmurk6OpSwaEkMIpwptYaTcGc+JiS7sA34HhGF
	 vBMwxKD+8YsKRAWPH+TVR23bRdXFlTL6mY8ugvCVUQAT9RSB3gGDCnNgRi70PimS1N
	 kyCuVKCzgDwAGiP1Ui3JsBEbZaxzndxkiGe1nOCxKWBIcO8EFTb70zIr6/Tka5buHj
	 BOTvZzV0qAGxINpQvfAWcLf8eud2UdMmx2rXGYzubACjvu/C/+KvaUaYWWJzx4EFJa
	 Qnhgr35j0TeYw==
Date: Tue, 20 Aug 2024 13:16:54 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: tsbogend@alpha.franken.de, arnd@arndb.de, akpm@linux-foundation.org, 
	linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: MT: Remove unused function mips_mt_regdump()
Message-ID: <efd56f19-8a39-472a-9ea7-f8f548c89aa7@marliere.net>
References: <20240814103933.2053611-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814103933.2053611-1-cuigaosheng1@huawei.com>

On 14 Aug 24 18:39, Gaosheng Cui wrote:
> The mips_mt_regdump() has not been used since
> commit b633648c5ad3 ("MIPS: MT: Remove SMTC support"), so remove it.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  arch/mips/include/asm/mips_mt.h |  2 -
>  arch/mips/kernel/mips-mt.c      | 77 ---------------------------------
>  2 files changed, 79 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mips_mt.h b/arch/mips/include/asm/mips_mt.h
> index 28917f1582b3..6ea02af29876 100644
> --- a/arch/mips/include/asm/mips_mt.h
> +++ b/arch/mips/include/asm/mips_mt.h
> @@ -17,8 +17,6 @@ extern int vpelimit;
>  extern cpumask_t mt_fpu_cpumask;
>  extern unsigned long mt_fpemul_threshold;
>  
> -extern void mips_mt_regdump(unsigned long previous_mvpcontrol_value);

Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>

> -
>  #ifdef CONFIG_MIPS_MT
>  extern void mips_mt_set_cpuoptions(void);
>  #else
> diff --git a/arch/mips/kernel/mips-mt.c b/arch/mips/kernel/mips-mt.c
> index c938ba208fc0..37676a44fefb 100644
> --- a/arch/mips/kernel/mips-mt.c
> +++ b/arch/mips/kernel/mips-mt.c
> @@ -43,83 +43,6 @@ static int __init maxtcs(char *str)
>  
>  __setup("maxtcs=", maxtcs);
>  
> -/*
> - * Dump new MIPS MT state for the core. Does not leave TCs halted.
> - * Takes an argument which taken to be a pre-call MVPControl value.
> - */
> -
> -void mips_mt_regdump(unsigned long mvpctl)
> -{
> -	unsigned long flags;
> -	unsigned long vpflags;
> -	unsigned long mvpconf0;
> -	int nvpe;
> -	int ntc;
> -	int i;
> -	int tc;
> -	unsigned long haltval;
> -	unsigned long tcstatval;
> -
> -	local_irq_save(flags);
> -	vpflags = dvpe();
> -	printk("=== MIPS MT State Dump ===\n");
> -	printk("-- Global State --\n");
> -	printk("   MVPControl Passed: %08lx\n", mvpctl);
> -	printk("   MVPControl Read: %08lx\n", vpflags);
> -	printk("   MVPConf0 : %08lx\n", (mvpconf0 = read_c0_mvpconf0()));
> -	nvpe = ((mvpconf0 & MVPCONF0_PVPE) >> MVPCONF0_PVPE_SHIFT) + 1;
> -	ntc = ((mvpconf0 & MVPCONF0_PTC) >> MVPCONF0_PTC_SHIFT) + 1;
> -	printk("-- per-VPE State --\n");
> -	for (i = 0; i < nvpe; i++) {
> -		for (tc = 0; tc < ntc; tc++) {
> -			settc(tc);
> -			if ((read_tc_c0_tcbind() & TCBIND_CURVPE) == i) {
> -				printk("  VPE %d\n", i);
> -				printk("   VPEControl : %08lx\n",
> -				       read_vpe_c0_vpecontrol());
> -				printk("   VPEConf0 : %08lx\n",
> -				       read_vpe_c0_vpeconf0());
> -				printk("   VPE%d.Status : %08lx\n",
> -				       i, read_vpe_c0_status());
> -				printk("   VPE%d.EPC : %08lx %pS\n",
> -				       i, read_vpe_c0_epc(),
> -				       (void *) read_vpe_c0_epc());
> -				printk("   VPE%d.Cause : %08lx\n",
> -				       i, read_vpe_c0_cause());
> -				printk("   VPE%d.Config7 : %08lx\n",
> -				       i, read_vpe_c0_config7());
> -				break; /* Next VPE */
> -			}
> -		}
> -	}
> -	printk("-- per-TC State --\n");
> -	for (tc = 0; tc < ntc; tc++) {
> -		settc(tc);
> -		if (read_tc_c0_tcbind() == read_c0_tcbind()) {
> -			/* Are we dumping ourself?  */
> -			haltval = 0; /* Then we're not halted, and mustn't be */
> -			tcstatval = flags; /* And pre-dump TCStatus is flags */
> -			printk("  TC %d (current TC with VPE EPC above)\n", tc);
> -		} else {
> -			haltval = read_tc_c0_tchalt();
> -			write_tc_c0_tchalt(1);
> -			tcstatval = read_tc_c0_tcstatus();
> -			printk("  TC %d\n", tc);
> -		}
> -		printk("   TCStatus : %08lx\n", tcstatval);
> -		printk("   TCBind : %08lx\n", read_tc_c0_tcbind());
> -		printk("   TCRestart : %08lx %pS\n",
> -		       read_tc_c0_tcrestart(), (void *) read_tc_c0_tcrestart());
> -		printk("   TCHalt : %08lx\n", haltval);
> -		printk("   TCContext : %08lx\n", read_tc_c0_tccontext());
> -		if (!haltval)
> -			write_tc_c0_tchalt(0);
> -	}
> -	printk("===========================\n");
> -	evpe(vpflags);
> -	local_irq_restore(flags);
> -}
> -
>  static int mt_opt_rpsctl = -1;
>  static int mt_opt_nblsu = -1;
>  static int mt_opt_forceconfig7;
> -- 
> 2.25.1
> 

