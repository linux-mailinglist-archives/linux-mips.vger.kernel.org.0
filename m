Return-Path: <linux-mips+bounces-12768-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 566FACFB965
	for <lists+linux-mips@lfdr.de>; Wed, 07 Jan 2026 02:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8910F30111B8
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jan 2026 01:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEE8182D0;
	Wed,  7 Jan 2026 01:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfE20v5h"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0FF7260D
	for <linux-mips@vger.kernel.org>; Wed,  7 Jan 2026 01:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767748978; cv=none; b=tub6VFT6Y4VSHKCG+DWBBYFrYGn0ARRJqrA2ErSHycoZWXGY07QCe6OQkp6f6s5EIoi4lcF/CT9HMCtUqWnCswRPFXlmtjJSBY69Ra1BwP1v+yw59mMjHZOFF9ytERFp5Afo4HJCyapKw535JCMm8YWYu2N4O5os09+33a+iqzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767748978; c=relaxed/simple;
	bh=w68wXr5ticdVcWVVKaG3ZzO4fx1vzPS9uhBCrz5e59U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFultv2ewEPIGP/yOfbcZChYg+J3g5gAZ8t6ds4ECz2aFU1kU/jfSRamsnpQDR7lfkYLenP5InCrvIIBRyu3sxiL3Ro9mp8yT9NMYBR8UBLgte7OJcD/ULW82RMw0bCdwcdSKKi5ozXT/WSaMQpDHMxFFGwAaPKfotmgOAbVD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfE20v5h; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b843e8a4fbfso114198666b.0
        for <linux-mips@vger.kernel.org>; Tue, 06 Jan 2026 17:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767748974; x=1768353774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tsd9UwM4vLqBKUeV9xw/hj4H2ka06I0/7uWJwrkW5U=;
        b=AfE20v5hY4zXpvqBPLdiBoaZIs/i0+NHPNy0ghWxy7ZLenzS/fgYrVOFzST6frSBzN
         jx0NC4Ss45cCKeVdlv+MHCrrU0jJ4+b/j1speO5cuq4zTFRZY3ZfvrAeWb/gg6ZNNDbI
         flUxocJKhnOQ+q4sDOV4cyXETHZaFJcba2teT9Tg2Qfdp29CTiaCL8X/tKHdo8CKVgOL
         qqbanC2uA68VH16Mr0sCDBMYbr/nf0qoAW9Q/MzjxR5fNFctwoDkkvpWEgpUqbLhcQr0
         O7Au1xBBvAgt9lZ2mzGywp7LFlCD/ANH1XR7EXCwtneiOv3vtsySXQWgpmsxd28e56Lr
         XJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767748974; x=1768353774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0tsd9UwM4vLqBKUeV9xw/hj4H2ka06I0/7uWJwrkW5U=;
        b=di5ISTWefc6QV/wWwigsGPlNPf12GdsQFxhTCXKF6YEUmLeXL9+MBA+q5OV08Q3BcC
         I+tx3o1dOQege6kbHBKzG9DK+xjn5B+SXx99uDu3z0CGlGpOdM01YGSb+CEOEJ+D2GFv
         yh1pG0RJE4jJ4N1AWa6ROZe6hYqct10pPUwq1R0QAOf3JNIJZjFKYaJFcALLmKI25Exg
         wqa8s53DQUnjqEwUbUpXqn/nFWlpdaPQcZU7M4znjg0KPMtUe1Y8BSsxORPd22VbFWZZ
         xoDVvzXCMaopiqPAq0zxIcX5KjFRZIOl8mBkUeYTxUe7TOHRbfyJSS6yP71DXfVoUau+
         Y/HA==
X-Forwarded-Encrypted: i=1; AJvYcCWkKC33xN3DKJ72b+RViZtnzIM0gOdpoVw14ax5w7Ua7ZcACMDYLqDNU3SP+juiwCvGOGU6PdZgsluT@vger.kernel.org
X-Gm-Message-State: AOJu0YwKg9G1Ayw8NmnbdfqQ2stgpLA657J86OVCXvX6JZlS9lFXSwOL
	XLMlcpOFa6KOzWDlA0eofwJh86QgMIOgHvtTn43QEdVTnASS0LibVr/dd4mZSyRm9pJaM6oFRu9
	skqquvu33reCdkAKVzcONDTPbE0Z+iO4=
X-Gm-Gg: AY/fxX4iDh48ZtBng/MblSxpZxpWToBK6JdQB26cZ6V/jy5KL9dh9DnrMCCAT2ZK0RM
	pn2RvJnRzRgwJ5g+rYwtxgBxntEunn2GC9+I8ypf6AE0jqoganAwqLay5hLPTVhvwybW2BRu8st
	qO7W954jnwmj/QevF7OwJy7TW4NRZ6BhZq4+WZAb6++fLpp6Ag+KrrCB71Vne1UOlu8jztnSMt2
	AILZwkMyD1DEfTPNj+C05AJLx4Jw/ho03/lKAA/cUkhgo8GmzmGCkl2NHlkpstUksg4oY5F
X-Google-Smtp-Source: AGHT+IHAqq5ImNkLGtB8Y1d2kLRKMdYzQ9MRuExrpqABDFBjUdXj3NxrF87jFkiZlC4Jeb6TBNib1kZQOqxBCF1a1Z8=
X-Received: by 2002:a17:907:70e:b0:b73:758c:c96f with SMTP id
 a640c23a62f3a-b844539fc89mr86070866b.52.1767748974057; Tue, 06 Jan 2026
 17:22:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767663073.git.zhoubinbin@loongson.cn> <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
 <20260106191314.GA2568583-robh@kernel.org>
In-Reply-To: <20260106191314.GA2568583-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 7 Jan 2026 09:22:41 +0800
X-Gm-Features: AQt7F2rx2FP62gHMLs01g481K6zXg39jS3zpWijBpVZVQd9ZycV4AZkWto4-qZQ
Message-ID: <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your review.

On Wed, Jan 7, 2026 at 3:13=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> > Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
> > interface of the Loongson-2K0300 chip.
> >
> > Its hardware design is similar to that of the Loongson-1B, but it does
> > not support the alarm feature.
>
> But you are requiring the interrupt property for it? Isn't it no alarm
> feature means no interrupt?

Yes, the `interrupts` attribute is not required without the alarm feature.

But my judgment condition is `not contains` (added in patch-1[1]).
There are only a few SoCs on the Loongson platform that don't support
the RTC alarm feature, so I think `not contains` looks cleaner and
simpler.

[1]: https://lore.kernel.org/all/8876bebaf08121bb5edd2500f5289284b75df011.1=
767663073.git.zhoubinbin@loongson.cn/

>
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  Documentation/devicetree/bindings/rtc/loongson,rtc.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/=
Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > index 8a2520f963d8..b62419c33fd5 100644
> > --- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > @@ -23,6 +23,7 @@ properties:
> >            - loongson,ls1b-rtc
> >            - loongson,ls1c-rtc
> >            - loongson,ls7a-rtc
> > +          - loongson,ls2k0300-rtc
> >            - loongson,ls2k1000-rtc
> >        - items:
> >            - enum:
> > @@ -49,6 +50,7 @@ if:
> >          contains:
> >            enum:
> >              - loongson,ls1c-rtc
> > +            - loongson,ls2k0300-rtc
> >
> >  then:
> >    required:
> > --
> > 2.47.3
> >

--=20
Thanks.
Binbin

