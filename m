Return-Path: <linux-mips+bounces-13083-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCxfFljNf2k1xwIAu9opvQ
	(envelope-from <linux-mips+bounces-13083-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 23:02:00 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF61C7550
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 23:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F9E830038D9
	for <lists+linux-mips@lfdr.de>; Sun,  1 Feb 2026 22:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBC72EAB72;
	Sun,  1 Feb 2026 22:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUP16xwB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE5121B918
	for <linux-mips@vger.kernel.org>; Sun,  1 Feb 2026 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769983306; cv=pass; b=FzhhIJbMlbjSergckjdhT6zui53bUELN640Uk8xKlbDdNnnRDP1Na3MawNL2gElc5e0Re/dnsHIgxdBzGNTSfMQJECVklAlRx4GoIqhTb4SAevcrb2//WGtbRgOFttXVL59kx1yi7kNnHxOa+1BZ4Uql+9Yz4WUJe3zaOSMVZsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769983306; c=relaxed/simple;
	bh=wl7Jk6JsU5yKG4duQoEsXxxYC+OIwiJhzlKIg8HfxyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QoP5pBJyOuam4sAHnbhHKemdYS2wKOADevHwqzvOi3Q/j05va+k8w5OFEHVREF28uZvQYnoVq02+8VeHtfiVQxxPKeBZ7eiY/9yeNWfH01okL0l6U6Zf+PS2OqhSjJhxtopOAToEtgfZs2/GMg1aulnIPCAFLVeSNUMkZKl5uOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUP16xwB; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso5447562a12.3
        for <linux-mips@vger.kernel.org>; Sun, 01 Feb 2026 14:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769983302; cv=none;
        d=google.com; s=arc-20240605;
        b=Bqty32s1bN/xah7qix+onafJpCh0+zYeRDYOTX7O1p7JQNPwYBuAMmKDKEEEPmNqYP
         vE6Rl4vUL15XG9mK+cwrlDy/t3KFNhTO1+0rxqb+hvGO+n+MWxTSIMV3I6/1goh0gtKZ
         se/MV8oqbIcOzbu3k7mqvhBE2BadD8C/+Zg+mtHiRNHmCtF3DPv8PKYfTt/R3EGGIRoZ
         gJshPmC8zfJexPJQAWuGjJ+StE9Rt+y+x+AIi5/10J1DUbsttC2IYk1lXJAV8LSwagGJ
         f1rh0vKd9DBr+eJ9wr7w7maNyrTwzvopnl1i8nou+ced7704diUH08NNB3Wbl/cIfAkg
         XWhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        fh=QR/FCdZ16HPlYmx+ZyNQH5wKhbEg7D9lA/rXGpfFVRc=;
        b=dE7BtKhIW+lPGm6yU0FgX8IGjHV2VQyGsk9EgeItMd2Fj20IJ4ysYs0vvHXHRCwcTH
         VDD+sBNALuNMQpaDgh3zCqDdbnWegv1PNFeuHXqGRNWp5CIGjwU6+uo5tVC7BTQeLBOI
         aze3lzSM1EHT0YvJAs38QsuPNytrGumnWXK39VK0QC/jOq+SUnYZ5WyGSDW9GufdcBka
         ESjm8vCVvUtY91zS8MKVWJsiAlRrphu7PHJnjkBcExiIbCZzSKvI8As4oKb3ctk0WEvN
         IlarE64W1B/22JkB9kKMjY9cnFfTkx48FG8eixcjSx/5EgAdfQolM2H5J9E8JuRWGlkh
         sWFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769983302; x=1770588102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        b=YUP16xwBByuCeANUpL+tqGPZtwW0ekBJQXjxvYHrQ+BVuJhzXlLPUbdngsjT9o0vf6
         uYUmzrEUKPWDyYwqImODBU03rkq/5q2r1ZRse77/5jbzZ2ZbdPfRWoEgDFXi7tvZQDib
         KKiwOMyTyPNTlE6DbDFUXbRkge9P5LbCelPWFufvSIQsld51sSM4Eb+aQDvPUDu+HqZ5
         c/EuzGYP26bua1tM6AhlMjxuishxSbB0C/tRmJtMEllP01kG1m4La3rFduj7FChnHhy9
         DMXci+K0JH5BarH9OsbnSb+egVIt1mbKSHqf6Rg3thvWSqfOWPIJWg6A+uJuZWSkOoYT
         3FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769983302; x=1770588102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        b=DBcuFMumksq2Ho4TTAXHnrx+A5sWMYfIQh/VdAYTQIVUAW7MU609tpr0pYhniJYQjN
         Qm4Zi5pkXito6pYAFMcrxRQ3P5Nhx96JfLSrCSCGk7wsKeUWmsEO/7xrJlTL1GN6eo7S
         j8Q06GXkNMIXoUGU6jAMI/0qDrdJDiHdJw8IptWzMrDuwShIKWwTLVbZUmWALQ2fLEKa
         wp1R7XdR01porN4f0dwDM2mbWj+aSCE3us4n/esRdrVVfVyE3USdRPTbS1RgzV08oFRn
         JXMhJW3Kp8wCxJAlviExHCI+4Nor+ZJEiDAbaT8iz4AsKX3Q34JS8JBP8HlRQEAeLLE1
         DIGw==
X-Forwarded-Encrypted: i=1; AJvYcCVCrepEPIPK1qSMLy8/APgBHh1Yy+q9nSsGLIPR1zJd6CcHAVtVk8L+R5WQkDdpVBfUcK9T1UXDG66z@vger.kernel.org
X-Gm-Message-State: AOJu0YyKliL0CGqwJYR+55CCNrnmhyeS5B45BFokDR+SZGa1y8Dzygj/
	Jz6mD6E2zYNhQjc9wGF1xuNvcxFtng/ndccRLxgT/P7ymWusyd32Uc2kPauWZ+fr/4oD0Snq0cG
	H+xWJ4jV71DdCW3lMEu/ELzbIAs0ECZI=
X-Gm-Gg: AZuq6aI+7sdpqK5J9mD3Ymr8FjHOafSDxBsIK+jp65wo148S28qNj2lAgVbIkUtZFYv
	5nrOowfvvaopwRavLCpga0KpuYlBqn4i+x+P5OQP/jaX/rGCtzfDC2apiigEoCBY81SnZTBi/al
	HpXgrDhjY/yBJBRrg16oL231XdvpQsSzSVPVV7amYPig3SCr5PSqXgy61DhQjfRedwg9Jt+Z+M9
	r6elh5mUYBXSDzncBNkmmnrqT8+0B7sthUroAxxx4AqF5jUuk25+9xOZ7650x+SQ+7UbtZ1TAGh
	AsfxvJT/7XJTNYVE7UP068JHmIXB
X-Received: by 2002:a05:6402:90b:b0:64c:9e19:9858 with SMTP id
 4fb4d7f45d1cf-658de58d61fmr5598076a12.22.1769983301701; Sun, 01 Feb 2026
 14:01:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1769515122.git.zhengqi.arch@bytedance.com> <3380f40a89b73c488202c85f9a8abf99fb08543b.1769515122.git.zhengqi.arch@bytedance.com>
In-Reply-To: <3380f40a89b73c488202c85f9a8abf99fb08543b.1769515122.git.zhengqi.arch@bytedance.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 1 Feb 2026 23:01:30 +0100
X-Gm-Features: AZwV_Qj9VNkT5OuGD6ka3IvGbnZ780_iMCZkDjCZeudKZ-RrGhxplhYBmunMjcY
Message-ID: <CA+=Fv5RhxvyxKr2t+pHd1tbGrK57P-+b3pGe1nVaK_OLiFt2wg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: david@kernel.org, andreas@gaisler.com, richard.weiyang@gmail.com, 
	will@kernel.org, peterz@infradead.org, aneesh.kumar@kernel.org, 
	npiggin@gmail.com, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-um@lists.infradead.org, 
	sparclinux@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13083-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,gaisler.com,gmail.com,infradead.org,arm.com,linux-foundation.org,vger.kernel.org,kvack.org,lists.linux.dev,lists.infradead.org,bytedance.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,bytedance.com:email]
X-Rspamd-Queue-Id: DEF61C7550
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 1:16=E2=80=AFPM Qi Zheng <qi.zheng@linux.dev> wrote=
:
>
> From: Qi Zheng <zhengqi.arch@bytedance.com>
>
> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of
> empty PTE page table pages (such as 100GB+). To resolve this problem,
> first enable MMU_GATHER_RCU_TABLE_FREE to prepare for enabling the
> PT_RECLAIM feature, which resolves this problem.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig           | 1 +
>  arch/alpha/include/asm/tlb.h | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 80367f2cf821c..6c7dbf0adad62 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -38,6 +38,7 @@ config ALPHA
>         select OLD_SIGSUSPEND
>         select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
>         select MMU_GATHER_NO_RANGE
> +       select MMU_GATHER_RCU_TABLE_FREE
>         select SPARSEMEM_EXTREME if SPARSEMEM
>         select ZONE_DMA
>         help
> diff --git a/arch/alpha/include/asm/tlb.h b/arch/alpha/include/asm/tlb.h
> index 4f79e331af5ea..ad586b898fd6b 100644
> --- a/arch/alpha/include/asm/tlb.h
> +++ b/arch/alpha/include/asm/tlb.h
> @@ -4,7 +4,7 @@
>
>  #include <asm-generic/tlb.h>
>
> -#define __pte_free_tlb(tlb, pte, address)              pte_free((tlb)->m=
m, pte)
> -#define __pmd_free_tlb(tlb, pmd, address)              pmd_free((tlb)->m=
m, pmd)
> -
> +#define __pte_free_tlb(tlb, pte, address)      tlb_remove_ptdesc((tlb), =
page_ptdesc(pte))
> +#define __pmd_free_tlb(tlb, pmd, address)      tlb_remove_ptdesc((tlb), =
virt_to_ptdesc(pmd))
> +
>  #endif
> --
> 2.20.1
>

Looks good from an Alpha perspective.

Acked-by: Magnus Lindholm <linmag7@gmail.com>

