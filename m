Return-Path: <linux-mips+bounces-8023-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27119A47EFE
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 14:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D770816B837
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 13:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6AE22FF39;
	Thu, 27 Feb 2025 13:21:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57B922DFAE;
	Thu, 27 Feb 2025 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662501; cv=none; b=XkMgrIdWvJ0hj51dfXJXxmiBky4d9INdUDTusr0kyGoo6Yd4TAU/oYVNHv+X45wHnPMphEofDzc4m3xBSiBv4Aak72jxwXu08siiocMF55tyNMBG7Kr+MHbDhW3hHrIJEUNyl9EnkUtqEVX7h7Msy2nz/xS6hThDF72+2kuIv84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662501; c=relaxed/simple;
	bh=KHJL4aBjL/xfUEQ3dzlxRvMvpwyqdBYuM/AU5jprt9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MePiNkwflNfbl5Da6OfoZsHVIzcCEd9wUa9kjJ8yHrw/P1v5tARRXrdhw6jdVWZYQ/qWFo58Hlw0Pc7Sj5ilEutOV16TJff88VxaMZTLp3MgMhh9AzuBSlz/E1ourpNGWGYU+axrDw8PR9v4QGys5XY4EZZkqc1FrRGuimNjp0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5209dad13b5so310018e0c.2;
        Thu, 27 Feb 2025 05:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740662498; x=1741267298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZScFKf+GfAOC+cGkef77m9WTcLt48410fHxRRqxMGc=;
        b=iNzXdTEAUUKzAj4GngghSR8fU37XIzXLmM2z1aWQWy2ZRQKS2DCPvfBFzMWJyyniA7
         lYEea5ylxHEPULrCicSmu8oS8bQHg2qjgOXeTj5k3VMfJSQqHqEgDcAL/iw6dTBWwTyQ
         uh/jQC6Oj0yUAb6RLX028/p+rsQE2h4Pusd3WpSiJs7WAVNZ2pgvnQGC5lNyP5atzazg
         Tg9kjljwsXkkPubsKdaB2d6LCovb08VTKuoVcqZKgqavydzzoBvwCXOcvU7T68uLrsHh
         h1Zn/OtRqnjHT5bAZOuUXIamVAc5iowxnC4GKrpQ7C7Zb24T4BB0LldnLp1dsAZR7oMG
         FRPw==
X-Forwarded-Encrypted: i=1; AJvYcCUn46xZweqwKHvgaNAGl008efrT8wBngLTe9g2m08oAtoqL+WtD9JOFN7ScAxAXbi/+Oyzy1fWIN0YMgQ==@vger.kernel.org, AJvYcCVRHAhg1LD/zjbg+C7KxfLr9swiUOcQDu57Ha1HcutSusWvLO1j/qlZvUEPKzt97TmNeYFe5ESXu6w5CW2c@vger.kernel.org, AJvYcCWeYQmwcSeWbakX76slp8YvZdh1RUfkIFUcEA2PjVpoP+4B+/6lz61+TPWiDkkSFE6T95UO9+Bk1ReDvs9o7+w=@vger.kernel.org, AJvYcCWxDtbkVL2uecxOnnKy/MPtVnXS3//0YdjySjCozUdH8ffZePBEtHbzARlfZ4b/+t4fdXoWZyhieN9Q@vger.kernel.org, AJvYcCXMwKI5o5Y+2iIO4E2vmj4VCuc+D8+TYWL4pauIeE3WXTF3+zzxiniIeZFy31F49pyTo1O6jGVoqqk=@vger.kernel.org, AJvYcCXgvImjiQ3+if9SASb5LjOw8Zpi5s/OfVkGHf/QSVeOFJJu3qtLPdw1+9nN9OlXZ0lEu9IRjYOxAROoFGuJ6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3LwJhzEcTvJUSu9g1wT0WOw+MFpIxfH5estU846EHCdU7ZGgK
	OxDlHaVAO/qnaSPzdMN97+SXrz/0H9ALJwt/ymUUsi+FQ2RmogxD/PYJ6x95
X-Gm-Gg: ASbGncs4Ee9cw8PRIqrXEpy4EKoOyP9/EQo7xH3URfoMWz2f4NEEW/TOi/bH1ES/exb
	Kh5i+wNKii8eeo7SbfT9YkCY3eYVbV18Xw6CVdf9sLW062AQZfBpTOZbHW5Zz/wOM6KurpXi8n6
	53fLGiFhVV0c6M4rWXbXPyKYpp/Q2jcN+UHLAFgkRKopU35fbR85VVw5Hj9Q+CILcimAfkChFcW
	KDj73TtyaRUoXhx/CBv+aVc1Uwdtzbid/yH8/g5b/vcBc8fKvHPxfEtSeh8lIk15egrbxLXWntP
	7lMDFZ+5F8+v8EDNLwRh/AKlh0FWLfgrfSB6Of8ZuoLapxN6cCy9h3476ujdNd8CEIzX
X-Google-Smtp-Source: AGHT+IH9anlYCVwhdh2BbHwsVXnPfg9ZW3Ms2ksh7LCy8a5Vfkv7XVedf0GsgMArvFuntbK2rmoeEg==
X-Received: by 2002:a05:6122:660e:b0:520:8911:df12 with SMTP id 71dfb90a1353d-5224cd35d72mr4110442e0c.10.1740662498241;
        Thu, 27 Feb 2025 05:21:38 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5234bf417fdsm204836e0c.23.2025.02.27.05.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 05:21:36 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-520aede8ae3so408812e0c.0;
        Thu, 27 Feb 2025 05:21:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6Xq3E58KiBxqg3FwEVOI5WJ9XA0sEmaxtRA7LDHRice8IVRkwSpvqV5GhXKyw/ouiyUYv3oO4nZZL9hUr0Q==@vger.kernel.org, AJvYcCUPbfj9zrli0CdQ0TOYSX+x72CxciHw8PWiSxGa+XwIu67+eaIRqj/73m5zbjaqc7JOtFlWXELeg3cQ3eJtz/4=@vger.kernel.org, AJvYcCUzO2t1bqk7sEv/GPD0m4XSf2Dez9bjIjMhQqA6Cs7WLaZleeDsw953+2hWcp0MyxaDmqpEm4bP7cqhag==@vger.kernel.org, AJvYcCVSh02+kZrICQj8ZhBECUqRm7eMZK+xmb87pC8ftxxU9kLtb8ipuFWi7k9rHbBFyBw/xdr9SmcLTwJu@vger.kernel.org, AJvYcCVpoiwlZlQRSyG6fFPwVPlrhsXIoeU2kSHJkdxSSdwGAX3tXNFQYKX5aNsDU+qJkcRzphOnnKQrJf5Xbsw4@vger.kernel.org, AJvYcCX/D05K7uWmxiHwFMyso3ymtorar2QOBzYSSpYRWzVFmCSZQZuRlQUaod3jq0SWF7du7/440Yf7tfY=@vger.kernel.org
X-Received: by 2002:a05:6122:1d53:b0:520:51a4:b81c with SMTP id
 71dfb90a1353d-5224ccbbe10mr3808700e0c.6.1740662495074; Thu, 27 Feb 2025
 05:21:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740454179.git.zhengqi.arch@bytedance.com> <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
In-Reply-To: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 14:21:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8ttibKCiUPxSNBpJyrtBbrt1CqLa++jq6CpJFbFCwAg@mail.gmail.com>
X-Gm-Features: AQ5f1Jqe6so1GjZXdkUhIIAiYHT08E9WH9vQcbiUEIVlcQBmr8vV6ha0mxzJuRo
Message-ID: <CAMuHMdU8ttibKCiUPxSNBpJyrtBbrt1CqLa++jq6CpJFbFCwAg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com, 
	vishal.moola@gmail.com, david@redhat.com, jannh@google.com, hughd@google.com, 
	willy@infradead.org, yuzhao@google.com, muchun.song@linux.dev, 
	akpm@linux-foundation.org, will@kernel.org, aneesh.kumar@kernel.org, 
	npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com, 
	rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, x86@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Qi,

On Tue, 25 Feb 2025 at 04:46, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
> nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
> and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
> tlb_remove_page()). This is the same as the implementation of
> tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
> convert these architectures to use tlb_remove_ptdesc().
>
> The ultimate goal is to make the architecture only use tlb_remove_ptdesc()
> or tlb_remove_table() for page table pages.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks for your patch!

>  arch/m68k/include/asm/sun3_pgalloc.h | 3 +--

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

> --- a/arch/m68k/include/asm/sun3_pgalloc.h
> +++ b/arch/m68k/include/asm/sun3_pgalloc.h
> @@ -19,8 +19,7 @@ extern const char bad_pmd_string[];
>
>  #define __pte_free_tlb(tlb, pte, addr)                         \
>  do {                                                           \
> -       pagetable_dtor(page_ptdesc(pte));                       \
> -       tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));        \
> +       tlb_remove_ptdesc((tlb), page_ptdesc(pte));             \
>  } while (0)
>

With only a single statement remaining, you can remove the do { ... }
while construct, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

