Return-Path: <linux-mips+bounces-11634-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C2BC6EF1
	for <lists+linux-mips@lfdr.de>; Thu, 09 Oct 2025 01:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ECC53BA55C
	for <lists+linux-mips@lfdr.de>; Wed,  8 Oct 2025 23:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB91F27B341;
	Wed,  8 Oct 2025 23:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="OJobgGYN"
X-Original-To: linux-mips@vger.kernel.org
Received: from sonic301-32.consmr.mail.ne1.yahoo.com (sonic301-32.consmr.mail.ne1.yahoo.com [66.163.184.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E02C2357
	for <linux-mips@vger.kernel.org>; Wed,  8 Oct 2025 23:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759966683; cv=none; b=usS9HxAEFqraQXu4u+vHZ7IvwkLvQ7kChwbBTXFpar6JaTYuFHzqNHHLyNXD632Wdf6tJbzDEQb+tNedFGL19Yj0q43sH/ekszR+DlgBoxgCWwCshMkn4qQCjZj+gza7L8E11Ckr+mR/EM4LgLQqejlc9W8mpRNlYFppmC3VZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759966683; c=relaxed/simple;
	bh=0u3JDq1ICnYd4SpF+i2z9Puo2ZlF6FIBbRO8WWbSc6w=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=IG69w8+eok8DSOoOsVgF3n55AzTpdbvawnKkgOdXntAT2YBYctYRUbaN8kRLvzJQrt3L+aRUbOVc1RDSCvoz+0r8dTfbjYeKrRGoyE/5Qv6cTp/r8810HKOYgFfqT5pKKSXgI80vCSnfN4GyFk3/ilRpqJtEEVA/132+szxy590=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=OJobgGYN; arc=none smtp.client-ip=66.163.184.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1759966681; bh=0u3JDq1ICnYd4SpF+i2z9Puo2ZlF6FIBbRO8WWbSc6w=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=OJobgGYNSgKcRtFYRz9xhSRWnXGqbWbvfKNA/kJdbze6ehWmf6BkRkrK/7XXSlEYETFXBhwJ5XqQIAli63b3WAK0ltEDv3xqW65t4uofx1K3dh8fe+3RH5kKZhlGEnwsbuV33QzQOW/T16BFviWY7Rw9yJWXdRyBcrGUZmDv6hnxa0kQfcCIVuZ0kRaw05xQwCbmIyWuAUIjB42Toswff3fsIS29P/Tfrk8syIh+9BukpBveh2DOYoqFysWx7i+UjtH67t01KGoNIs5Ymbxe89c/e8CPO+E/mQ1RLLrFv/amrV2cpKuYDtYTMctEs5HBItYaAbufcKOTtzxkuqhS/g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1759966681; bh=t1K9RG/wifre169ZnYPy3Eg6RhMdGb4gfD3LTeuvGdS=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=KYBFUOIdxtwUS8hRjJgv8zdbO7YJFIaL7P+0pvcplQMdJ0veSMhWcf7HRz320iUqRYyasjXA0qYg7XohCtrOglJ5gkd66a29IU0lt2936QkmxpHsuXKlmoIGOv3myr+3iGGFLf4V0tjEhdepeH4KAXRf2Y9/HgYEcU1BxSlBgLWLqssCxqRv5P7Bb1DpwXUk+ZO3NAsZFOwY41VqKfL0A/83/Jz95ZSj6YbQj/zX6MdF7Kc8x6KxNaK3Re0V5Oz1jQijfO2vIDe63XBnHss9T66Db5j7e6hLztCwUELcVV68MMmwJhEiqMkNqM86uWEVhenrbK8bF+XWxcJGF0B5lw==
X-YMail-OSG: u9FWakUVM1nsobwZJornJqvezTPQzfwm_Q.uvxOR2iPeJQkulplH.UCruHABWXq
 cxz9cziHhjr_PUoD9IUbTpw06Cl4tRLNPZr.0wLIzSNC6yurki3_aZ0IY5bgxDBaRAEVZmlcxznZ
 igHv9JOEzurZrA7IMwK2hf4.6hd0l7VloXPMzjK4qQEQonyoTw9eiavWnA6qLd1dqbSq16cVWBov
 qKgdcYhyVuWIymH9UcpBmQMPAi01az4uCzRUEzMZCaibFgy6uMzMjltBEGz31IgZQZE1jCrHlZYr
 T1vX8QG4QLb0Bbuuw_dVCTk.guIGN6lWywo_8dR06eOBSbviSPy1q9Mg0QtjK9ZptYzN4FxvVnm9
 9q3.XtN3nztZN.VgpVGBGQHvIs1K9HwJlBvSfylGNu3Nc59a7Wt2VaHmEOOp65tB.gCTkRU93ZI_
 H5duSkqdrs1AyNKmPkxD.3qS.Yz8LNk16xzSny2j0bpxFcno3d4cYC_lsJgUrkXvn8kMxaXs.rBw
 aU4.48frhQXm7U3tviI27ajDrjarbF2vfKDxq5UrEEMV2UQclMmFmLg12rCiTbQrpaIRtVgDc4ak
 CwmyPl8gcQi.K8Q0sOrG7hR793a6UEJTNjaKdcy9TKzezxYC3Wj73wmw2nlfJuz3RmPyoMYHG7L9
 TySpXpm6TjRzPqNlh9..jarh7tn4.lVsNxaWRHe6gzAwk4iypi2MrVWv1Bay8JgzQov..IQxpGGr
 Uznm.7LO4gdUiwMK47jEV8PAnZNqSJaDZiFF3CJiidgGf6lbKyCbkTeNiYLg7Vwd1vgYrLB75DzD
 ._nqFEqHNYpqX6cS2RQ9de1wCQ5oukPJV9lC_PFmGKNxt.FcveD5yQS2MEpq9e.jdt7tIWffkzEf
 k1wEZ5tGtUvELtaDz7njOS8jA3_3F_DO6ouVfDw6HYO80jrfFivMK3LbTiUl2wxHdO8FrHiTFz0X
 yR9LyzfM7RGhxxv3aMzRssJ0wJIt_bhmiapr4JiI5wFNc1O6w.sWr1X9Phuc1NTAfbHHjorL7iZE
 xrR4wK4hhGF7ytNaS0daZaKE1dBBXDVODeHOK9OY.iXnS0zqtnZ__pdLBKMh5Cb05oJ5cNmkjPoO
 MMSdoD4qT1S5Dr60ktkKMa9MKvrjnqw2v0Q6H1VhBqGJP80c6777yve2UeBmWdJu8F8B7KfFsq8X
 Dhp6PxXqcsiWbQRNlnhaLlwXFWQNHKXNB2uiWZ1.0qry3NdR8RQ4zDmiFeshFUg5x1eBeUFPfRT.
 D1rI728BZShyuFshOujNxtOM4uV2766bJQ8R71jNJnSuZzqQX1hwI723chDeaMRK2xNYWCQX7QAK
 xQ0ZOBNsdnG9sRcn_ZfqdylTdntuBw7BsGhCYUkJKIvvZ00JY12pesZeC6rY5dcoypmnd5ehasfq
 yJr8QDOf6iPhy6atyY4u7PUr7W8_Wr9dWwPwr5kMMPknG7jVoEkkpfzAUuMU4kX6kJj1QbSxpBp5
 W0sPhJxHSwGk5ZBEnPsNYDNgmXxSf_wnZxtKwqV_vohpjvhZoenTLnTl8uACmTwu9deQpEbsSj.X
 fHqw2GoWc9SMB_tUTYi.PqGLfxcEsrtu6E02gA54AkefyZLm6irpHKpjIb70XhPuYJ2k9Yj6D0BH
 4vvkGhf21lTnsp84ijzx_fYymrs4vYP90JbOsNHzRSGYD_YbZlf6VqEYEh1UCJg6DYL8cNFp19d5
 739Z._8sQZI_G_bLWLXdMk61XI38iIcrJUUC66BeY5M7a74sQDkJIYM_kX0PI1pOSb4lnrhZl3mv
 ONs4tqwmkDA8LhJRc5soUIqYznG0wppT0zW0ZjyWj8vx6AA3Vbi0AbLXY6iI5ACs2EFNPOHvPEZg
 D4koenQEDZdt7rqjyTpzcKkIs5I1mX21W875XWIkGllDmT.FGm.OyKwwzZTPUqtnb.AoVyVlQBc8
 EgwTCMwqBRhUi6regrEbx7HOy6LfHL0VzMEG4T0s0oeQpuq0wTE50rBhFOUXriW0VLoAdNisFQY.
 8lk_3bh.XpuMOPwpIukI4amnDriHYpy3SxIoaZmvlhfR_vElcVrgDxhryNJeo_DdXawRXwvE9psj
 ACxpObV9dz0UfUP8HicCk6yLnEb8yBbdbRG.5ssowMDjRfjZDEczBDxbPIUdDgQc0WhtDP9CKPes
 cu_Zw8qoGj7kegjDxg3Xx.Kw0OFga84KmRHx3zgmIzk_kDxwBpdpaSfrg64hPeyOog7xjDMQdV8X
 4lusXwwFyCe.imIbuolA17i_bJvbn0Hcc4w--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 782ad789-89d8-428b-9d86-638a34bd8aae
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Wed, 8 Oct 2025 23:38:01 +0000
Date: Wed, 8 Oct 2025 23:17:25 +0000 (UTC)
From: Mietek N <namiltd@yahoo.com>
To: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-ID: <93986679.1000024.1759965445400@mail.yahoo.com>
Subject: [PATCH] ramips/mt7620: IRQ-protect stack ASLR randomization  in
 arch_align_stack
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <93986679.1000024.1759965445400.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.24562 YMailNorrin

On MT7620 (MIPS 24KEc), sporadic Oopses were observed during execve while

randomizing the new process stack in arch_align_stack(), which calls

get_random_u32_below(PAGE_SIZE).




On MIPS32, even the "<=16-bit" multiply path used by get_random_u32_below()

emits a 32-bit multiply and reads HI/LO via mfhi/mflo. If a hard IRQ fires

between multu and mfhi/mflo and its handler also executes mul/div, HI/LO can

be clobbered, leading to corrupted intermediates and bogus addresses.




Make the random stack offset computation IRQ-safe on MT7620 by wrapping the

get_random_u32_below(PAGE_SIZE) call with local_irq_save/restore(), ensuring

the multu/mfhi/mflo sequence is not interrupted by hard IRQs. This preserves

stack ASLR while eliminating the crash on this platform.




Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>




--- a/arch/mips/kernel/process.c

+++ b/arch/mips/kernel/process.c

@@ -715,8 +715,16 @@ unsigned long mips_stack_top(void)

*/

unsigned long arch_align_stack(unsigned long sp)

{

- if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)

+ if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space) {

#if defined(CONFIG_MIPS) && !defined(CONFIG_CPU_MIPSR6)

+ unsigned long flags;

+ local_irq_save(flags);

sp -= get_random_u32_below(PAGE_SIZE);

+ local_irq_restore(flags);

+#else

+ sp -= get_random_u32_below(PAGE_SIZE);

+#endif

+ }




return sp & ALMASK;

}

