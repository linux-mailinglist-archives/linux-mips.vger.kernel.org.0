Return-Path: <linux-mips+bounces-1822-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF00686A06C
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 20:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F41E0B327C4
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 19:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F9C149006;
	Tue, 27 Feb 2024 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="OA3dlSfH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="riRmiP+B"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E057145FE6
	for <linux-mips@vger.kernel.org>; Tue, 27 Feb 2024 19:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709061752; cv=none; b=i63OvnbMBfq/Y0jpL8FORT4ISeGbszq69BPsbguwn9Npx5rKURKRJLK7Z0oj/Un+yP5dbCfEu3qDwRqGwMgt+o7BG8XKpPFnsBgucmcZqbJ8Bm0ct4uMsn6mgRO837V1eN2CmGAp30liIJANIlGM7Q9YtUOhfltXG3tS6OZkn3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709061752; c=relaxed/simple;
	bh=kIs2FUl4HZeK3cBZ7PkzvYW5Njk9XDgeOi6LXd+2KA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ufp563TU2FgFxPqMsN5+8XDmu741Vw1cpi+blf4YBRjJtkb+Y++NSv4ij0GL1EJTiVoTLfQZxJAC37dog83D7mLgDglC1pZlNTa4C7xvrgOe1M1yC3M1CJ7G10LprpRZtDyoXaSfgCD6eWmbjFwuDMo+FYem6mrxOCJm/tZK7RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=OA3dlSfH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=riRmiP+B; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 2DCB91380092;
	Tue, 27 Feb 2024 14:22:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 27 Feb 2024 14:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1709061748;
	 x=1709148148; bh=t3QsRQJgAFYs4dpz20BpT0X4KOAD2/aUb7w8NUrkbWc=; b=
	OA3dlSfHEc6aXz2R7KHyH46YNLijAksSxK7ZH6UEHMhrMtON2t82PIju638Tzymo
	R/MHQebtdu5zJs0JPYXUVHBVCGEQDgAr7k7UeEXWr9QKuCv2KVV2On4y7OkihU65
	7OiTPNmymuhDcZIBcDjuXmP9bCHhk4DQYJMTU9z2WiKEb9F1aOiXcKb4Ba+7pGlX
	X5bMLrnazo6aQF60/LuNXIqPP/T4czIXbcRgUjgmTxWpkwh+9/ySkX3nkX61h4Z5
	n3++qtIdBaCmZldhT1Eg12FQ+LfqgjQPevO8MgLiLJNkjOZJXvlC47TSGG/FGIK+
	Finq0izNT+KEg8eVY1vPmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709061748; x=
	1709148148; bh=t3QsRQJgAFYs4dpz20BpT0X4KOAD2/aUb7w8NUrkbWc=; b=r
	iRmiP+BdHRG6DjrLN+KL5CbFR2hYv0/tmx8nTl076o/PiCySSHyEY54sd5hLZfy3
	hInXG0yvWNEMCH0MgJ2TSrgDcaUMOtmO79Pm/+/bcpV43677RZZRBk2lWcLWJ0HU
	IRagOJMV4AGhbwnjl2EFqnOr6GG4oOu8sG5TaGtboQA7qWoxS98/geNcuYpvDCxj
	kGQ0cyxWfH++G27aUIJd8VnXcMZqkSI12v244g2yNW7HjwWU1EuZgjseHmTJUEm4
	9Kv8XWE0NCJgIR1jSob82YaXQh0rErvgQdCJtqupM7L5YjJMJ3ajHPoM2OprWCb6
	9smohC/917ArN6RapWVjg==
X-ME-Sender: <xms:czbeZVAaTeu3iCWbHr6o9lAjLfGIFhkn9d5meyrxCe3yCVJ3KyRKjA>
    <xme:czbeZTgwLl_aa5mkAHYsZ0o-NRCM6ZtjAGSu4sU7JQ5GkszrH-E2suooKsAYxqBas
    ZKl6jCYC3WO5xz7DIc>
X-ME-Received: <xmr:czbeZQkw_QDdpvfROqehnEdpeti5dnGywHMVdfgFf4i10Q_5QYVxJ-A_3hKI9Lm8iBiluJeBaA8wttCTp8QqE1WeMjn85Ac9wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeekkeduiedutefhudffheekfedtfeejueeftdegheejhfelkeff
    jeeltdeiveffjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihu
    nhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:czbeZfz1JEBNkJsTPZHYoFn8_h4_zsxIcB_DcXFDMN_vR7AWhFNQVw>
    <xmx:czbeZaToUA07Q_Aibeba62b-7rVUN8o9cJ6sM-s2Ldee--QA4kKnSg>
    <xmx:czbeZSYCjYxCLfAd0AATQs8oW3jXvL-DIH2zkfnKrXMwO3YHe669zQ>
    <xmx:dDbeZXJGpzfEfBVz6H4mW5brsMbdEOlc6DHmLmW8mW7k_K-3dEP35A>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Feb 2024 14:22:26 -0500 (EST)
Message-ID: <d93079f8-2402-4d06-846b-5375cbeead3c@flygoat.com>
Date: Tue, 27 Feb 2024 19:22:24 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: parse_r register name (was: [linux-next:master 9092/10236]
 arch/mips/kernel/mips-mt.c:3207: Error: Unable to parse register name $fp)
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <lkp@intel.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <202402270524.HtRvZbPR-lkp@intel.com>
Content-Language: en-US
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Autocrypt: addr=jiaxun.yang@flygoat.com;
 keydata= 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
 HVO98ZmbMeg=
In-Reply-To: <202402270524.HtRvZbPR-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(Top posting for visibility)

Hi Thomas,

We had a discussion on this issue[1], the conclusion was it's a clang 
misbehavior,
however, it turns out that GCC is doing the same.

Do you want to pick that patch?

Thanks

[1]: 
https://lore.kernel.org/all/20230409104309.13887-6-jiaxun.yang@flygoat.com/

在 2024/2/26 21:26, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8552c902efe7ef670b6961fb8885b67961aeb629
> commit: dd6d29a6148990bb1d39a37c6c2830e6daf9cb46 [9092/10236] MIPS: Implement microMIPS MT ASE helpers
> config: mips-randconfig-r034-20221221 (https://download.01.org/0day-ci/archive/20240227/202402270524.HtRvZbPR-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402270524.HtRvZbPR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402270524.HtRvZbPR-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     arch/mips/kernel/mips-mt.c: Assembler messages:
>>> arch/mips/kernel/mips-mt.c:3207: Error: Unable to parse register name $fp
>     arch/mips/kernel/mips-mt.c:3210:  Info: macro invoked from here
>     {standard input}:3216:   Info: macro invoked from here
>
>
> vim +3207 arch/mips/kernel/mips-mt.c
>
> b24413180f5600 Greg Kroah-Hartman 2017-11-01    1  // SPDX-License-Identifier: GPL-2.0
> 41c594ab65fc89 Ralf Baechle       2006-04-05    2  /*
> b633648c5ad3cf Ralf Baechle       2014-05-23    3   * General MIPS MT support routines, usable in AP/SP and SMVP.
> 41c594ab65fc89 Ralf Baechle       2006-04-05    4   * Copyright (C) 2005 Mips Technologies, Inc
> 41c594ab65fc89 Ralf Baechle       2006-04-05    5   */
> 41c594ab65fc89 Ralf Baechle       2006-04-05    6
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07    7  #include <linux/device.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05    8  #include <linux/kernel.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05    9  #include <linux/sched.h>
> 73bc256d47a232 Paul Gortmaker     2011-07-23   10  #include <linux/export.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05   11  #include <linux/interrupt.h>
> f72af3cf06370c Yoichi Yuasa       2006-07-04   12  #include <linux/security.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05   13
> 41c594ab65fc89 Ralf Baechle       2006-04-05   14  #include <asm/cpu.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05   15  #include <asm/processor.h>
> 60063497a95e71 Arun Sharma        2011-07-26   16  #include <linux/atomic.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05   17  #include <asm/hardirq.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05   18  #include <asm/mmu_context.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05   19  #include <asm/mipsmtregs.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05   20  #include <asm/r4kcache.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05   21  #include <asm/cacheflush.h>
> 4666cf018a26d8 Arnd Bergmann      2023-12-04   22  #include <asm/mips_mt.h>
> 41c594ab65fc89 Ralf Baechle       2006-04-05   23
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   24  int vpelimit;
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   25
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   26  static int __init maxvpes(char *str)
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   27  {
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   28  	get_option(&str, &vpelimit);
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   29
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   30  	return 1;
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   31  }
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   32
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   33  __setup("maxvpes=", maxvpes);
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   34
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   35  int tclimit;
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   36
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   37  static int __init maxtcs(char *str)
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   38  {
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   39  	get_option(&str, &tclimit);
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   40
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   41  	return 1;
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   42  }
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   43
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   44  __setup("maxtcs=", maxtcs);
> 07cc0c9e65d3e2 Ralf Baechle       2007-07-27   45
> 41c594ab65fc89 Ralf Baechle       2006-04-05   46  /*
> 41c594ab65fc89 Ralf Baechle       2006-04-05   47   * Dump new MIPS MT state for the core. Does not leave TCs halted.
> 41c594ab65fc89 Ralf Baechle       2006-04-05   48   * Takes an argument which taken to be a pre-call MVPControl value.
> 41c594ab65fc89 Ralf Baechle       2006-04-05   49   */
> 41c594ab65fc89 Ralf Baechle       2006-04-05   50
> 41c594ab65fc89 Ralf Baechle       2006-04-05   51  void mips_mt_regdump(unsigned long mvpctl)
> 41c594ab65fc89 Ralf Baechle       2006-04-05   52  {
> 41c594ab65fc89 Ralf Baechle       2006-04-05   53  	unsigned long flags;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   54  	unsigned long vpflags;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   55  	unsigned long mvpconf0;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   56  	int nvpe;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   57  	int ntc;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   58  	int i;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   59  	int tc;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   60  	unsigned long haltval;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   61  	unsigned long tcstatval;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   62
> 41c594ab65fc89 Ralf Baechle       2006-04-05   63  	local_irq_save(flags);
> 41c594ab65fc89 Ralf Baechle       2006-04-05   64  	vpflags = dvpe();
> 41c594ab65fc89 Ralf Baechle       2006-04-05   65  	printk("=== MIPS MT State Dump ===\n");
> 41c594ab65fc89 Ralf Baechle       2006-04-05   66  	printk("-- Global State --\n");
> 41c594ab65fc89 Ralf Baechle       2006-04-05   67  	printk("   MVPControl Passed: %08lx\n", mvpctl);
> 41c594ab65fc89 Ralf Baechle       2006-04-05   68  	printk("   MVPControl Read: %08lx\n", vpflags);
> 41c594ab65fc89 Ralf Baechle       2006-04-05   69  	printk("   MVPConf0 : %08lx\n", (mvpconf0 = read_c0_mvpconf0()));
> 41c594ab65fc89 Ralf Baechle       2006-04-05   70  	nvpe = ((mvpconf0 & MVPCONF0_PVPE) >> MVPCONF0_PVPE_SHIFT) + 1;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   71  	ntc = ((mvpconf0 & MVPCONF0_PTC) >> MVPCONF0_PTC_SHIFT) + 1;
> 41c594ab65fc89 Ralf Baechle       2006-04-05   72  	printk("-- per-VPE State --\n");
> 41c594ab65fc89 Ralf Baechle       2006-04-05   73  	for (i = 0; i < nvpe; i++) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05   74  		for (tc = 0; tc < ntc; tc++) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05   75  			settc(tc);
> 41c594ab65fc89 Ralf Baechle       2006-04-05   76  			if ((read_tc_c0_tcbind() & TCBIND_CURVPE) == i) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05   77  				printk("  VPE %d\n", i);
> d223a86154f8c6 Ralf Baechle       2007-07-10   78  				printk("   VPEControl : %08lx\n",
> d223a86154f8c6 Ralf Baechle       2007-07-10   79  				       read_vpe_c0_vpecontrol());
> d223a86154f8c6 Ralf Baechle       2007-07-10   80  				printk("   VPEConf0 : %08lx\n",
> d223a86154f8c6 Ralf Baechle       2007-07-10   81  				       read_vpe_c0_vpeconf0());
> 41c594ab65fc89 Ralf Baechle       2006-04-05   82  				printk("   VPE%d.Status : %08lx\n",
> 41c594ab65fc89 Ralf Baechle       2006-04-05   83  				       i, read_vpe_c0_status());
> b012cffe7f6971 Ralf Baechle       2008-07-15   84  				printk("   VPE%d.EPC : %08lx %pS\n",
> b012cffe7f6971 Ralf Baechle       2008-07-15   85  				       i, read_vpe_c0_epc(),
> b012cffe7f6971 Ralf Baechle       2008-07-15   86  				       (void *) read_vpe_c0_epc());
> d223a86154f8c6 Ralf Baechle       2007-07-10   87  				printk("   VPE%d.Cause : %08lx\n",
> d223a86154f8c6 Ralf Baechle       2007-07-10   88  				       i, read_vpe_c0_cause());
> 41c594ab65fc89 Ralf Baechle       2006-04-05   89  				printk("   VPE%d.Config7 : %08lx\n",
> 41c594ab65fc89 Ralf Baechle       2006-04-05   90  				       i, read_vpe_c0_config7());
> 41c594ab65fc89 Ralf Baechle       2006-04-05   91  				break; /* Next VPE */
> 41c594ab65fc89 Ralf Baechle       2006-04-05   92  			}
> 41c594ab65fc89 Ralf Baechle       2006-04-05   93  		}
> 41c594ab65fc89 Ralf Baechle       2006-04-05   94  	}
> 41c594ab65fc89 Ralf Baechle       2006-04-05   95  	printk("-- per-TC State --\n");
> 41c594ab65fc89 Ralf Baechle       2006-04-05   96  	for (tc = 0; tc < ntc; tc++) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05   97  		settc(tc);
> 41c594ab65fc89 Ralf Baechle       2006-04-05   98  		if (read_tc_c0_tcbind() == read_c0_tcbind()) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05   99  			/* Are we dumping ourself?  */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  100  			haltval = 0; /* Then we're not halted, and mustn't be */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  101  			tcstatval = flags; /* And pre-dump TCStatus is flags */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  102  			printk("  TC %d (current TC with VPE EPC above)\n", tc);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  103  		} else {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  104  			haltval = read_tc_c0_tchalt();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  105  			write_tc_c0_tchalt(1);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  106  			tcstatval = read_tc_c0_tcstatus();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  107  			printk("  TC %d\n", tc);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  108  		}
> 41c594ab65fc89 Ralf Baechle       2006-04-05  109  		printk("   TCStatus : %08lx\n", tcstatval);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  110  		printk("   TCBind : %08lx\n", read_tc_c0_tcbind());
> b012cffe7f6971 Ralf Baechle       2008-07-15  111  		printk("   TCRestart : %08lx %pS\n",
> b012cffe7f6971 Ralf Baechle       2008-07-15  112  		       read_tc_c0_tcrestart(), (void *) read_tc_c0_tcrestart());
> 41c594ab65fc89 Ralf Baechle       2006-04-05  113  		printk("   TCHalt : %08lx\n", haltval);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  114  		printk("   TCContext : %08lx\n", read_tc_c0_tccontext());
> 41c594ab65fc89 Ralf Baechle       2006-04-05  115  		if (!haltval)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  116  			write_tc_c0_tchalt(0);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  117  	}
> 41c594ab65fc89 Ralf Baechle       2006-04-05  118  	printk("===========================\n");
> 41c594ab65fc89 Ralf Baechle       2006-04-05  119  	evpe(vpflags);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  120  	local_irq_restore(flags);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  121  }
> 41c594ab65fc89 Ralf Baechle       2006-04-05  122
> 41c594ab65fc89 Ralf Baechle       2006-04-05  123  static int mt_opt_rpsctl = -1;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  124  static int mt_opt_nblsu = -1;
> 982f6ffeeed5ef Ralf Baechle       2009-09-17  125  static int mt_opt_forceconfig7;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  126  static int mt_opt_config7 = -1;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  127
> 41c594ab65fc89 Ralf Baechle       2006-04-05  128  static int __init rpsctl_set(char *str)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  129  {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  130  	get_option(&str, &mt_opt_rpsctl);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  131  	return 1;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  132  }
> 41c594ab65fc89 Ralf Baechle       2006-04-05  133  __setup("rpsctl=", rpsctl_set);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  134
> 41c594ab65fc89 Ralf Baechle       2006-04-05  135  static int __init nblsu_set(char *str)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  136  {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  137  	get_option(&str, &mt_opt_nblsu);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  138  	return 1;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  139  }
> 41c594ab65fc89 Ralf Baechle       2006-04-05  140  __setup("nblsu=", nblsu_set);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  141
> 41c594ab65fc89 Ralf Baechle       2006-04-05  142  static int __init config7_set(char *str)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  143  {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  144  	get_option(&str, &mt_opt_config7);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  145  	mt_opt_forceconfig7 = 1;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  146  	return 1;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  147  }
> 41c594ab65fc89 Ralf Baechle       2006-04-05  148  __setup("config7=", config7_set);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  149
> 982f6ffeeed5ef Ralf Baechle       2009-09-17  150  static unsigned int itc_base;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  151
> 41c594ab65fc89 Ralf Baechle       2006-04-05  152  static int __init set_itc_base(char *str)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  153  {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  154  	get_option(&str, &itc_base);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  155  	return 1;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  156  }
> 41c594ab65fc89 Ralf Baechle       2006-04-05  157
> 41c594ab65fc89 Ralf Baechle       2006-04-05  158  __setup("itcbase=", set_itc_base);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  159
> 41c594ab65fc89 Ralf Baechle       2006-04-05  160  void mips_mt_set_cpuoptions(void)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  161  {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  162  	unsigned int oconfig7 = read_c0_config7();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  163  	unsigned int nconfig7 = oconfig7;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  164
> 41c594ab65fc89 Ralf Baechle       2006-04-05  165  	if (mt_opt_rpsctl >= 0) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  166  		printk("34K return prediction stack override set to %d.\n",
> 41c594ab65fc89 Ralf Baechle       2006-04-05  167  			mt_opt_rpsctl);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  168  		if (mt_opt_rpsctl)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  169  			nconfig7 |= (1 << 2);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  170  		else
> 41c594ab65fc89 Ralf Baechle       2006-04-05  171  			nconfig7 &= ~(1 << 2);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  172  	}
> 41c594ab65fc89 Ralf Baechle       2006-04-05  173  	if (mt_opt_nblsu >= 0) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  174  		printk("34K ALU/LSU sync override set to %d.\n", mt_opt_nblsu);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  175  		if (mt_opt_nblsu)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  176  			nconfig7 |= (1 << 5);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  177  		else
> 41c594ab65fc89 Ralf Baechle       2006-04-05  178  			nconfig7 &= ~(1 << 5);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  179  	}
> 41c594ab65fc89 Ralf Baechle       2006-04-05  180  	if (mt_opt_forceconfig7) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  181  		printk("CP0.Config7 forced to 0x%08x.\n", mt_opt_config7);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  182  		nconfig7 = mt_opt_config7;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  183  	}
> 41c594ab65fc89 Ralf Baechle       2006-04-05  184  	if (oconfig7 != nconfig7) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  185  		__asm__ __volatile("sync");
> 41c594ab65fc89 Ralf Baechle       2006-04-05  186  		write_c0_config7(nconfig7);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  187  		ehb();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  188  		printk("Config7: 0x%08x\n", read_c0_config7());
> 41c594ab65fc89 Ralf Baechle       2006-04-05  189  	}
> 41c594ab65fc89 Ralf Baechle       2006-04-05  190
> 41c594ab65fc89 Ralf Baechle       2006-04-05  191  	if (itc_base != 0) {
> 41c594ab65fc89 Ralf Baechle       2006-04-05  192  		/*
> 41c594ab65fc89 Ralf Baechle       2006-04-05  193  		 * Configure ITC mapping.  This code is very
> 41c594ab65fc89 Ralf Baechle       2006-04-05  194  		 * specific to the 34K core family, which uses
> 41c594ab65fc89 Ralf Baechle       2006-04-05  195  		 * a special mode bit ("ITC") in the ErrCtl
> 41c594ab65fc89 Ralf Baechle       2006-04-05  196  		 * register to enable access to ITC control
> 41c594ab65fc89 Ralf Baechle       2006-04-05  197  		 * registers via cache "tag" operations.
> 41c594ab65fc89 Ralf Baechle       2006-04-05  198  		 */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  199  		unsigned long ectlval;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  200  		unsigned long itcblkgrn;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  201
> 41c594ab65fc89 Ralf Baechle       2006-04-05  202  		/* ErrCtl register is known as "ecc" to Linux */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  203  		ectlval = read_c0_ecc();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  204  		write_c0_ecc(ectlval | (0x1 << 26));
> 41c594ab65fc89 Ralf Baechle       2006-04-05  205  		ehb();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  206  #define INDEX_0 (0x80000000)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  207  #define INDEX_8 (0x80000008)
> 41c594ab65fc89 Ralf Baechle       2006-04-05  208  		/* Read "cache tag" for Dcache pseudo-index 8 */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  209  		cache_op(Index_Load_Tag_D, INDEX_8);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  210  		ehb();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  211  		itcblkgrn = read_c0_dtaglo();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  212  		itcblkgrn &= 0xfffe0000;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  213  		/* Set for 128 byte pitch of ITC cells */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  214  		itcblkgrn |= 0x00000c00;
> 41c594ab65fc89 Ralf Baechle       2006-04-05  215  		/* Stage in Tag register */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  216  		write_c0_dtaglo(itcblkgrn);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  217  		ehb();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  218  		/* Write out to ITU with CACHE op */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  219  		cache_op(Index_Store_Tag_D, INDEX_8);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  220  		/* Now set base address, and turn ITC on with 0x1 bit */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  221  		write_c0_dtaglo((itc_base & 0xfffffc00) | 0x1 );
> 41c594ab65fc89 Ralf Baechle       2006-04-05  222  		ehb();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  223  		/* Write out to ITU with CACHE op */
> 41c594ab65fc89 Ralf Baechle       2006-04-05  224  		cache_op(Index_Store_Tag_D, INDEX_0);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  225  		write_c0_ecc(ectlval);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  226  		ehb();
> 41c594ab65fc89 Ralf Baechle       2006-04-05  227  		printk("Mapped %ld ITC cells starting at 0x%08x\n",
> 41c594ab65fc89 Ralf Baechle       2006-04-05  228  			((itcblkgrn & 0x7fe00000) >> 20), itc_base);
> 41c594ab65fc89 Ralf Baechle       2006-04-05  229  	}
> 41c594ab65fc89 Ralf Baechle       2006-04-05  230  }
> 41c594ab65fc89 Ralf Baechle       2006-04-05  231
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  232  struct class *mt_class;
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  233
> 15d2ce7129f25c Liam R. Howlett    2022-07-29  234  static int __init mips_mt_init(void)
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  235  {
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  236  	struct class *mtc;
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  237
> 1aaba11da9aa7d Greg Kroah-Hartman 2023-03-13  238  	mtc = class_create("mt");
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  239  	if (IS_ERR(mtc))
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  240  		return PTR_ERR(mtc);
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  241
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  242  	mt_class = mtc;
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  243
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  244  	return 0;
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  245  }
> 27a3bbaf4b1e23 Ralf Baechle       2007-02-07  246
> 15d2ce7129f25c Liam R. Howlett    2022-07-29  247  subsys_initcall(mips_mt_init);
>

-- 
---
Jiaxun Yang


