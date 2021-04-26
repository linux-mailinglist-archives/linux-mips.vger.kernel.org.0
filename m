Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9909136BB55
	for <lists+linux-mips@lfdr.de>; Mon, 26 Apr 2021 23:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234497AbhDZVnq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Apr 2021 17:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbhDZVnq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Apr 2021 17:43:46 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5FDC061574;
        Mon, 26 Apr 2021 14:43:03 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4FTdfs63PVzQk1C;
        Mon, 26 Apr 2021 23:43:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
        t=1619473379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5ThGRYtIT0Xf5EcsvLom88a5OB6as8AShYIxI5j+0zI=;
        b=BoY6pzyOol+4uR0XyRuiOYQE0uRUKZm7MsB7raTPrynmGusJ04t8QOkdnybImot6LkHJlH
        9Bl/8UCCwd7SlPss0VGLi4VN/AHoaxXV+wl6TYMafcukOLAAkhAbmOnBT1ghfC/emTASRn
        QQ8ydX+PxQwCHhIYkIehZ+ySvXib7+xdeYKzdevjxJ9xun8MNixeavi7WFepSIZ9mCdJ30
        0rA5wXQ+83z4CwAf2cJ1LkC6LMjZUNNydfbf9g290yPx3aQanfFm2OzaTJ29M/DyVDTANA
        RZHgVoma8qIRmVnZg4PhGakW0dE/oLK0XAnnnmfuQKyf8Y3Gv8lLC+BwpaWL6Q==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id zfk35RdLgCyX; Mon, 26 Apr 2021 23:42:57 +0200 (CEST)
Subject: Re: [PATCH v2 3/3] MIPS: kernel: proc: add CPU option reporting
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210424215618.1017539-1-ilya.lipnitskiy@gmail.com>
 <20210424215618.1017539-4-ilya.lipnitskiy@gmail.com>
From:   Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <ae83282b-19e6-8b91-443b-40f393fb1433@hauke-m.de>
Date:   Mon, 26 Apr 2021 23:42:56 +0200
MIME-Version: 1.0
In-Reply-To: <20210424215618.1017539-4-ilya.lipnitskiy@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.28 / 15.00 / 15.00
X-Rspamd-Queue-Id: 12EE917FC
X-Rspamd-UID: d5211b
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/24/21 11:56 PM, Ilya Lipnitskiy wrote:
> From: Hauke Mehrtens <hauke@hauke-m.de>
> 
> Many MIPS CPUs have optional CPU features which are not activated for
> all CPU cores. Print the CPU options, which are implemented in the core,
> in /proc/cpuinfo. This makes it possible to see which features are
> supported and which are not supported. This should cover all standard
> MIPS extensions. Before, it only printed information about the main MIPS
> ASEs.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> 
> Changes from original patch[0]:
> - Remove cpu_has_6k_cache and cpu_has_8k_cache due to commit 6ce91ba8589a
>    ("MIPS: Remove cpu_has_6k_cache and cpu_has_8k_cache in cpu_cache_init()")
> - Add new options: mac2008_only, ftlbparex, gsexcex, mmid, mm_sysad,
>    mm_full
> - Use seq_puts instead of seq_printf as suggested by checkpatch
> - Minor commit message reword
> 
> [0]: https://lore.kernel.org/linux-mips/20181223225224.23042-1-hauke@hauke-m.de/
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

Thanks for taking care of this patch.

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

> ---
>   arch/mips/kernel/proc.c | 122 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 122 insertions(+)
> 
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 7d8481d9acc3..376a6e2676e9 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -157,6 +157,128 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>   		seq_printf(m, "micromips kernel\t: %s\n",
>   		      (read_c0_config3() & MIPS_CONF3_ISA_OE) ?  "yes" : "no");
>   	}
> +
> +	seq_puts(m, "Options implemented\t:");
> +	if (cpu_has_tlb)
> +		seq_puts(m, " tlb");
> +	if (cpu_has_ftlb)
> +		seq_puts(m, " ftlb");
> +	if (cpu_has_tlbinv)
> +		seq_puts(m, " tlbinv");
> +	if (cpu_has_segments)
> +		seq_puts(m, " segments");
> +	if (cpu_has_rixiex)
> +		seq_puts(m, " rixiex");
> +	if (cpu_has_ldpte)
> +		seq_puts(m, " ldpte");
> +	if (cpu_has_maar)
> +		seq_puts(m, " maar");
> +	if (cpu_has_rw_llb)
> +		seq_puts(m, " rw_llb");
> +	if (cpu_has_4kex)
> +		seq_puts(m, " 4kex");
> +	if (cpu_has_3k_cache)
> +		seq_puts(m, " 3k_cache");
> +	if (cpu_has_4k_cache)
> +		seq_puts(m, " 4k_cache");
> +	if (cpu_has_tx39_cache)
> +		seq_puts(m, " tx39_cache");
> +	if (cpu_has_octeon_cache)
> +		seq_puts(m, " octeon_cache");
> +	if (cpu_has_fpu)
> +		seq_puts(m, " fpu");
> +	if (cpu_has_32fpr)
> +		seq_puts(m, " 32fpr");
> +	if (cpu_has_cache_cdex_p)
> +		seq_puts(m, " cache_cdex_p");
> +	if (cpu_has_cache_cdex_s)
> +		seq_puts(m, " cache_cdex_s");
> +	if (cpu_has_prefetch)
> +		seq_puts(m, " prefetch");
> +	if (cpu_has_mcheck)
> +		seq_puts(m, " mcheck");
> +	if (cpu_has_ejtag)
> +		seq_puts(m, " ejtag");
> +	if (cpu_has_llsc)
> +		seq_puts(m, " llsc");
> +	if (cpu_has_guestctl0ext)
> +		seq_puts(m, " guestctl0ext");
> +	if (cpu_has_guestctl1)
> +		seq_puts(m, " guestctl1");
> +	if (cpu_has_guestctl2)
> +		seq_puts(m, " guestctl2");
> +	if (cpu_has_guestid)
> +		seq_puts(m, " guestid");
> +	if (cpu_has_drg)
> +		seq_puts(m, " drg");
> +	if (cpu_has_rixi)
> +		seq_puts(m, " rixi");
> +	if (cpu_has_lpa)
> +		seq_puts(m, " lpa");
> +	if (cpu_has_mvh)
> +		seq_puts(m, " mvh");
> +	if (cpu_has_vtag_icache)
> +		seq_puts(m, " vtag_icache");
> +	if (cpu_has_dc_aliases)
> +		seq_puts(m, " dc_aliases");
> +	if (cpu_has_ic_fills_f_dc)
> +		seq_puts(m, " ic_fills_f_dc");
> +	if (cpu_has_pindexed_dcache)
> +		seq_puts(m, " pindexed_dcache");
> +	if (cpu_has_userlocal)
> +		seq_puts(m, " userlocal");
> +	if (cpu_has_nofpuex)
> +		seq_puts(m, " nofpuex");
> +	if (cpu_has_vint)
> +		seq_puts(m, " vint");
> +	if (cpu_has_veic)
> +		seq_puts(m, " veic");
> +	if (cpu_has_inclusive_pcaches)
> +		seq_puts(m, " inclusive_pcaches");
> +	if (cpu_has_perf_cntr_intr_bit)
> +		seq_puts(m, " perf_cntr_intr_bit");
> +	if (cpu_has_ufr)
> +		seq_puts(m, " ufr");
> +	if (cpu_has_fre)
> +		seq_puts(m, " fre");
> +	if (cpu_has_cdmm)
> +		seq_puts(m, " cdmm");
> +	if (cpu_has_small_pages)
> +		seq_puts(m, " small_pages");
> +	if (cpu_has_nan_legacy)
> +		seq_puts(m, " nan_legacy");
> +	if (cpu_has_nan_2008)
> +		seq_puts(m, " nan_2008");
> +	if (cpu_has_ebase_wg)
> +		seq_puts(m, " ebase_wg");
> +	if (cpu_has_badinstr)
> +		seq_puts(m, " badinstr");
> +	if (cpu_has_badinstrp)
> +		seq_puts(m, " badinstrp");
> +	if (cpu_has_contextconfig)
> +		seq_puts(m, " contextconfig");
> +	if (cpu_has_perf)
> +		seq_puts(m, " perf");
> +	if (cpu_has_mac2008_only)
> +		seq_puts(m, " mac2008_only");
> +	if (cpu_has_ftlbparex)
> +		seq_puts(m, " ftlbparex");
> +	if (cpu_has_gsexcex)
> +		seq_puts(m, " gsexcex");
> +	if (cpu_has_shared_ftlb_ram)
> +		seq_puts(m, " shared_ftlb_ram");
> +	if (cpu_has_shared_ftlb_entries)
> +		seq_puts(m, " shared_ftlb_entries");
> +	if (cpu_has_mipsmt_pertccounters)
> +		seq_puts(m, " mipsmt_pertccounters");
> +	if (cpu_has_mmid)
> +		seq_puts(m, " mmid");
> +	if (cpu_has_mm_sysad)
> +		seq_puts(m, " mm_sysad");
> +	if (cpu_has_mm_full)
> +		seq_puts(m, " mm_full");
> +	seq_puts(m, "\n");
> +
>   	seq_printf(m, "shadow register sets\t: %d\n",
>   		      cpu_data[n].srsets);
>   	seq_printf(m, "kscratch registers\t: %d\n",
> 

