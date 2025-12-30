Return-Path: <linux-mips+bounces-12647-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 941BFCE890C
	for <lists+linux-mips@lfdr.de>; Tue, 30 Dec 2025 03:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A75453012BC3
	for <lists+linux-mips@lfdr.de>; Tue, 30 Dec 2025 02:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2C82BD5A7;
	Tue, 30 Dec 2025 02:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aa/MPRuU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C782D94BF
	for <linux-mips@vger.kernel.org>; Tue, 30 Dec 2025 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061934; cv=none; b=pyXnhEmf0jBznmgafl5bVLWhWP8hHNmwyOQ7yhDBSjscHy4Bm4NEQZYv4vjjuMdw4TBBL4jcpp3h5H/yjwqFUd1i86Y6fmGHljOQwDK1ANyTpxcFjzFhn42dMs5l5VW6s06sW1kc8cYN3TrFDgBJoNrLy0Zhz9cw7nCKjnJSgPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061934; c=relaxed/simple;
	bh=UMHU9FmII2BurntGYXoChYkmEDJXCqDMzuY736PKDTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxkDA+dVb/O1/arEdaBV2DsnUSvPK4vYZV4cq1pN02wsjHHiDxqviJ89B77W5Qe6AXpwLN0thOBkbHsCzC2Ms4rfQbhMVN3R+JIGbFpckMN87l+l21EaHWi0LqypH9DlWlnPLeIBuyImZ7JsfscJJ/3b1wSgWvJQin3FE4RHrkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aa/MPRuU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so1681351366b.0
        for <linux-mips@vger.kernel.org>; Mon, 29 Dec 2025 18:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061931; x=1767666731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBMHX2/QGEuOryuyCmbWYYHbFM4ebeYaX/cSO55xE1E=;
        b=aa/MPRuUJLzNlEreB9jp7yNhisTEKlfOvhN4FJJ4MpMeVa6LXh4CgXZP9qbWQm+ojJ
         g02fM+Q3UPod7hLykjFrY8J/OXSW90U20zh145SjWEJ/fFt7ueh/rWtQAbuxnIIG49pl
         pVY4FtCzwbXJIOtX0DfgSCswAx2k2nfdtgCr5I20Q/9L8AJJfUvr73Op5+RstGgAOo/5
         iWTwOYhTRK3bhoLO9dkzf1h+LtwqG5S0f/5FoodH7Xa7WfRY3qgWM6aIHL+I1KNPnkh1
         HrjmJssPcbZx+Jr33ZLkdlieNXF7PU1UJXz44oiNShro02qriAUdpBhr5+FFl3cXo5Ut
         p9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061931; x=1767666731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sBMHX2/QGEuOryuyCmbWYYHbFM4ebeYaX/cSO55xE1E=;
        b=UL17KTUq8pSsYfNE4f/zH7ghAS7HG7bbLIqn1/++QotAcvCTXwzWsdbSfJxQtCi9sW
         Jrbx0yFknTsyampobuKXl9VLY4HYOzAj1oD1hnsVyHrMf+IeOjr5gHKN4/17zWN2nFkI
         9dR2Sy8waEpWm7Mr4Y3Ui099pX4yYNGaWhZH85mM3H4zcV3da/CQWqn+rHPFjbhdmmoH
         wlUcbwryj5vffYRffXvHpHKtBHhpsW1WkyiK5GASUSAm0an/a6re9d69ML9ofKQWJmy2
         2DULH+VtG7O7y8ZKbia73xx/xGVnnIpKeKeyB5Laj1AkeLTErFd9QXoWkB0SqQCcmMAK
         m6QA==
X-Forwarded-Encrypted: i=1; AJvYcCVbytdaln1V9oXDeLu2q9ozKwPGK8LAFJ7PGQs6j3LaaEuC4cZS9ggDtDxls+WWbc515Iw9QhqOfIDy@vger.kernel.org
X-Gm-Message-State: AOJu0YxKup6I4W/Q6ePPVXSdyMarBGNoZwDYkw/IoiPSlYzbn3BiuT8f
	Nv/kmjekMrOpMk4yyvhmCwwxiHCoJcr7qXTs+HXfdwJutopE6BzDYcTz2LS97H0LOTw00q/w3tf
	hWegNTbYN/cu4jQM2BsUvZ0V+pUje3lE=
X-Gm-Gg: AY/fxX7m3y5En3Nkk4lhFgBWm1fKM2909NtXoTVwJZeDXPueMg7GFpUsBGMfTb6Ua7J
	AIwyE69k1tarGK/kBRGctk5aq9kRayFPp6atZxKPYLUljdrPIh5Nf7vHWY1Ouyr3S7MCZU9+RUm
	kBroaitublracsNzKt1uMlni5R3Jk0vtFDb2GVnrnFuTTcfMmSObGM8T1Bq+yyOyN+AwNaE4/L/
	+n9AWn/IYDEG3ub1DTXUJRuvqAwHKk1TosSlk1aTinpS2ydPPl+SdKoEvxCrC6RJu+Das91
X-Google-Smtp-Source: AGHT+IHRI/1hilnmEBrcFgJMUaKhYNaI/HUlJK981gxPRBIjFC1foGTgVsgO3/XCEuH6fbfjUrJWTnDdqb3jBT/2yYw=
X-Received: by 2002:a17:907:5cb:b0:b83:972c:77fb with SMTP id
 a640c23a62f3a-b83972c7894mr49876366b.46.1767061931091; Mon, 29 Dec 2025
 18:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766471839.git.zhoubinbin@loongson.cn> <36544ba0d847bca639632ea0c74907de90975f80.1766471839.git.zhoubinbin@loongson.cn>
 <20251230021517.GA3156793-robh@kernel.org>
In-Reply-To: <20251230021517.GA3156793-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 30 Dec 2025 10:31:58 +0800
X-Gm-Features: AQt7F2pMi81j0FMjvtCowEi-qdK1ZAjfhHDDJAMxPmxQUDHeMO8p72a4qVr-54E
Message-ID: <CAMpQs4JbqK2zD-s8Erzj0SPue=97hk7tYBanFiQiefzkof+QiQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: rtc: loongson: Document
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

On Tue, Dec 30, 2025 at 10:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Dec 23, 2025 at 02:42:12PM +0800, Binbin Zhou wrote:
> > Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
> > interface of the Loongson-2K0300 chip.
> >
> > Its hardware design is similar to that of the Loongson-1B, but it does
> > not support the alarm feature.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/rtc/loongson,rtc.yaml       | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/=
Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > index f89c1f660aee..aac91c79ffdb 100644
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
> > @@ -42,6 +43,18 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls1c-rtc
>
> This seems unrelated?

Loongson-1C does not support the alarm feature, so the `interrupts`
property is not needed.

Technically, this is my fault and should have been described in the
binding before, just correcting it now.
Perhaps I should have mentioned this in the commit message.
>
> > +          - loongson,ls2k0300-rtc
> > +
> > +then:
> > +  properties:
> > +    interrupts: false
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/interrupt-controller/irq.h>
> > --
> > 2.47.3
> >

--=20
Thanks.
Binbin

