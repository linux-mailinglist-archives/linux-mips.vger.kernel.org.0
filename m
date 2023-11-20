Return-Path: <linux-mips+bounces-121-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606497F1DA2
	for <lists+linux-mips@lfdr.de>; Mon, 20 Nov 2023 20:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91FA21C20EB4
	for <lists+linux-mips@lfdr.de>; Mon, 20 Nov 2023 19:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A5736B00;
	Mon, 20 Nov 2023 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY2eAvDD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05929AA;
	Mon, 20 Nov 2023 11:59:38 -0800 (PST)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1e9bb3a0bfeso3000181fac.3;
        Mon, 20 Nov 2023 11:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700510377; x=1701115177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJBR3xUJ90fNqoXNnd3g+YCrJa3COLV0n8rrwwfxSX0=;
        b=HY2eAvDDZiv24MeUWpSyl1qqkiuL1mapjg+3F3u3TKKJGWTOXnm7oDXOKS4z4zBFig
         Q6Ky8FPySafYaDOM0eOWuHuhgE2Mn+0nht0fJ7To2OdNm8z8pdTTKHgSs6AWGyA8zNlI
         y3puLE5Xi0kGnn7AlQN8m5/5/ixWbrjll5qFZlgT2BzlNwCO+XBkf9ZHFaAKjW78gm+/
         TiFLFJkqYUwoQ3d7tnaJlF/kyFMLJGr5XmV2MyYybeW/F1U+2gmT4rDHI71gj1ziT2zy
         eP7APQWObOzJww5I+5nKueGH38lfFNdRD5SOarJb/G8gxdFI1vu1bzYP/VRxAx5LhCci
         8qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700510377; x=1701115177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJBR3xUJ90fNqoXNnd3g+YCrJa3COLV0n8rrwwfxSX0=;
        b=NaySBAPx8cGPyXe0ZkCGdnlV8KJ9gxv7QDTDOfhFnFTGGnSDtCXQW1Jy5ZJwf7fiwA
         lu5oO7ujGm8wsINJWjjblUTsCrnSGD/BnD9CowiHqolBOeRkeORLvRBSwYtqK9s6W2MB
         agd2iuJFSeBPfEEgDl644i+p0bnzXGTiuOyCKl12706JPb6W/pHxzLJemOc3lEPr0MJf
         FfrzvlZUQ0MHkjG8VPD6P7EsvQlJ+Xqyn0tbaxQ+IS1qE2WY5i5UXkrMBsoT1P40gSpp
         6VnGK+Q761qEbswSEO1mT5BS/25ttGv/IR/UloxqIM5TdGZXroQPSZ7qcp6RICkiftFR
         y4Xg==
X-Gm-Message-State: AOJu0YwwbHaBHom7UgsBslcNthzTqNlaCW7ZL2FeU5xZ6+MAosBgsOHE
	mi83PuLrOzO5GO1i+ITsMWpxja96pJ7DPpNGAZtfD9cU
X-Google-Smtp-Source: AGHT+IHErDTudVD9D0Xs6J9fHo53Jc2qgzfK4kq24U4ws4Et4usKh7Ru6ZcV/W943JLQEEu6O9dDRJe1Gv7tRXOquxI=
X-Received: by 2002:a05:6871:82b:b0:1e9:dd4b:d0aa with SMTP id
 q43-20020a056871082b00b001e9dd4bd0aamr9331470oap.48.1700510377374; Mon, 20
 Nov 2023 11:59:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231022090633.792831-1-sergio.paracuellos@gmail.com> <513bc341-25b8-5a57-d760-861a3e88a4a1@linaro.org>
In-Reply-To: <513bc341-25b8-5a57-d760-861a3e88a4a1@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 20 Nov 2023 20:59:25 +0100
Message-ID: <CAMhs-H8A0p=nFSnU9pRn=rTC_=CH6jXFQdYgZdimFNq9+dVqSw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of the Ralink architecture
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: linux-mips@vger.kernel.org, john@phrozen.org, tsbogend@alpha.franken.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 2:58=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 22/10/23 11:06, Sergio Paracuellos wrote:
> > Its been a while since I am making contributions to this architecture.
> > Hence add myself as maintainer.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> > Hi John, if you are not ok with this please let me know. In other case
> > please ack this patch. I can add myself as Reviewer if you prefer to
> > maintain alone this.
> >
> > Thanks in advance for your time!
> >
> > Best regards,
> >      Sergio Paracuellos
> >
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Thomas, can you take this patch through the mips tree?

Thanks,
    Sergio Paracuellos

