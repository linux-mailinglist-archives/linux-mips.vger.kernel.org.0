Return-Path: <linux-mips+bounces-8808-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA9A9E2F7
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 14:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E6CF3BE988
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 12:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DA523AD;
	Sun, 27 Apr 2025 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5oVLiBm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC64184E;
	Sun, 27 Apr 2025 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745757138; cv=none; b=EYkYJEzIuQ6SS644aO6ilEYZz9MExCN7X+qjU5XDjam68YQaqpNAHK/3eAQQWNbQGksUhP0ZILSM31MXNSv3VOHoow9zgpq7ZZmMx7f6aGqbJaSZelQhb2NZ5Fpc6xSEgsNdLas4ySSmnCSyxhos0MTVL4llFWi8kRLIAn5K2qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745757138; c=relaxed/simple;
	bh=tXLp0FVVZmHLaxygzWb9mxmm2SRoNXs4D0Gs4lHN/xI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+1ljHrYm1iYf7XMMzQIbobmM9UGCp/7/NmfOxNDEAaa4oMt/Ke6oHL7JEF7PF1/7DwMb4RGaDPHIqsI7SL1mTg5w4+5yXNwajrCb9DucgeaHLLpyaN4pkwymPESOGQ/Aa6r7/6g7K2AotUpdcz9HHDJANbD197owd538+YanQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5oVLiBm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F37C4AF09;
	Sun, 27 Apr 2025 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745757137;
	bh=tXLp0FVVZmHLaxygzWb9mxmm2SRoNXs4D0Gs4lHN/xI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O5oVLiBmy94UImor4FNK+qKd9F0E5m3Y9bNPWTT7RjWe59mh1hqi41/dhF8e36Cot
	 dFb0PrhZz1kbSMXpV+wUELo3oxV0tR4psCn/9W0RzPJGYe5aL4HUDWE8sRReSPvfzz
	 5rFNgTUoVk6jQzXGLE9UnEVsoykO6nHP/VFv+Y/NBm7gMdE4ck+2OEmP6nb0nbuinq
	 rNyCFrlOs8c/dXIowO/c9jnpWCq5icVE84rIjYte05wVTViK8Nasbv5K0GXNWyi/l6
	 69ys5+Ln4vXZGOteUNzKevShIZVXjo40vWYkVZx2JImFTh4FXGjBWYM9OiZdggwkLq
	 mpwBO2gQ5TYoA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb39c45b4eso605339066b.1;
        Sun, 27 Apr 2025 05:32:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1jZmZvqV0HvrbdEjP6E+9n2AkXTIqSt7A1gn/htpABdxckqNYC4S1hsIK4pD3g5JEVokEJGvwllf24g==@vger.kernel.org, AJvYcCXUOYCECFNPxUVkEWHQR01RmaKC0I87teFIjdNVyRzz1VSlSosbvpCXx+QgVmNXWuoHArXOoLkNEAP/vMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxyywS2nRvwhhuMRim2ruE3s80Fpsq7C0kWJL5hH4Zc5GL4uTr
	74wEwa12taKDecdUiCD4qeyXu3hooF8uRs99wH7c4ot2KMBYKyh9TW/uaNAovpzyHFbmGD2cbXz
	KS3ArIdiMqWD9xPbVmJNUkqm3yGo=
X-Google-Smtp-Source: AGHT+IErJWElj/gHHWva7MYrCfkTwgN6qc2W4Z9jmnKncd/n6uS2vunWLywT0Kn6kT3JKrr/NZQSkTNGNFl87qSYo1E=
X-Received: by 2002:a17:906:5281:b0:ace:9d35:6423 with SMTP id
 a640c23a62f3a-ace9d35658bmr184058966b.57.1745757136334; Sun, 27 Apr 2025
 05:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427113423.67040-2-thorsten.blum@linux.dev>
In-Reply-To: <20250427113423.67040-2-thorsten.blum@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 27 Apr 2025 20:32:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6kxy9NaWXqq1QLfobVvVz9-VMybHC6M+0V-sE3MY9SRA@mail.gmail.com>
X-Gm-Features: ATxdqUEFHYuBaO38PRJQBuwEGKmF3_prYcfvj-lwNGF2gAJ4HD9f0eP4vZYKDPk
Message-ID: <CAAhV-H6kxy9NaWXqq1QLfobVvVz9-VMybHC6M+0V-sE3MY9SRA@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: Fix MAX_REG_OFFSET
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Oleg Nesterov <oleg@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thorsten,

On Sun, Apr 27, 2025 at 7:35=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Fix MAX_REG_OFFSET to point to the last register in 'pt_regs' and not to
> the marker itself, which could allow regs_get_register() to return an
> invalid offset.
>
> Fixes: 40e084a506eb ("MIPS: Add uprobes support.")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Compile-tested only.
>
> Changes in v2:
> - Fix MAX_REG_OFFSET as suggested by Maciej (thanks!)
> - Link to v1: https://lore.kernel.org/lkml/20250411090032.7844-1-thorsten=
.blum@linux.dev/
>
> Changes in v3:
> - Keep the marker and avoid using #ifdef by adjusting MAX_REG_OFFSET as
>   suggested by Thomas and Maciej
> - Link to v2: https://lore.kernel.org/lkml/20250417174712.69292-2-thorste=
n.blum@linux.dev/
> ---
>  arch/mips/include/asm/ptrace.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrac=
e.h
> index 85fa9962266a..ef72c46b5568 100644
> --- a/arch/mips/include/asm/ptrace.h
> +++ b/arch/mips/include/asm/ptrace.h
> @@ -65,7 +65,8 @@ static inline void instruction_pointer_set(struct pt_re=
gs *regs,
>
>  /* Query offset/name of register from its name/offset */
>  extern int regs_query_register_offset(const char *name);
> -#define MAX_REG_OFFSET (offsetof(struct pt_regs, __last))
> +#define MAX_REG_OFFSET \
> +       (offsetof(struct pt_regs, __last) - sizeof(unsigned long))
There is no 80 columns limit now, so no new line needed here.

Huacai

>
>  /**
>   * regs_get_register() - get register value from its offset
> --
> 2.49.0
>
>

