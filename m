Return-Path: <linux-mips+bounces-3523-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EAA8FFA08
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2024 04:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD65F1F24929
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2024 02:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0E812B93;
	Fri,  7 Jun 2024 02:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXWlmtbI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13BDDAB;
	Fri,  7 Jun 2024 02:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717727812; cv=none; b=IWAigpfpvZ3hHF0Dtn9Nw7eAWQLXy6D1pZRrpG6hQmAmrDmVbf+OI98TGqJoR+QomaXsdm/QqLDmQ4NnA8aDM+W83h5pST0d4kpINZ+2j9U02g+Z8xDAaYijYBc6JfQVPlCxxtpb47zY1DlgVee9EeIPmLPs3zjfbBsmFzI+I08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717727812; c=relaxed/simple;
	bh=9FT1TKKXopE3OMwBOJ8Hqvx5oI4pkokNKbrBa0vgBUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMHCx1DSjuZBtuauslMpBHNwXe6IWbkhRxyVTxqjGD10YzJPMzy4lQ0qy0pk+/crl4Vn3uW/KTySrhhbUfimOs+zMAbYuWq3VWaMVAZwlFNNkoxNfwMa+3FuvzIFY5y3CCvbtKlZnamg680pv+budH1tzdFx0m34rszKnedSPb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXWlmtbI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a68b334eb92so70187366b.0;
        Thu, 06 Jun 2024 19:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717727809; x=1718332609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/Sdxbh2EbAbfKXus3Wfg+HU1FfoVKPNyddUoHaCXs0=;
        b=kXWlmtbIsUPHdq9DVZkzKcTsP77ZMnyrZWMvFNMed3Aly81N4tw0ZWX393L4SNW4nT
         2kp77/cwbmj+QqY6VDCSYx3MKlQMtVOedboWDibjpVzMwJrmivpghicGLUnsDMftaNNg
         U41nY1h+TDaLNhKHlxe2Y9ACXF71Yp8AdDl1GIDeA2VLUFY3OwyKGPKP3e6q8FVx8Wmz
         Yl9ZnyvCscscvx4OyzoAaZQnLZVo2sLwYn9yCkNzEDEat8VRp8r4WvihPGVqGX7IhO+1
         VU/VXn3q2L7ajMYKrAATEXT8BSWhi7YdtJjiJd/cJMTgRrofVJq34J1kD8OJCbofUbx0
         pJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717727809; x=1718332609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/Sdxbh2EbAbfKXus3Wfg+HU1FfoVKPNyddUoHaCXs0=;
        b=ZhFjLOyVUrsh3KdZFVFPHQWoGssXgBpVl76Bx6AbXUWyGDXa/VfH3UsKSRJYkoce9l
         JiK9AHcgnGtwzK3WpX/jPtpv7S1kqoPUthnOClez+9aP62gMnMNTsChJoIoAkIWnZlnZ
         IchFpYmw1D5hsL01QL9mHgyKReHxuCtQaHaUagg9webyVFBL6tq9DvnNG5kdvPYxJEBv
         OV/oAqc5ASakZFNSYaLLc0auyMx4GP0Ff8fwcOhbFwWe1/xTh295o9UhlIi2cLKQymD3
         GNJLFX2b53hnLaoqY198BRSJnUAZf+LfPA7xGdkS+bre4uQ9mgblEUvQCIFmLIVTTbsr
         94nw==
X-Forwarded-Encrypted: i=1; AJvYcCXPMAkVTgO/eXvp2m3WGT4lwz/emP0YgncZOxUkcZSscQGwQrXxfLFkUn+C4jrDY8AOkvytSWdvZthPNaxbdyy14scFJn9r1ay+H9Gt5AGQZeT4p7Jw+EV04Jb98YIYqgFMsDLjzwNiR9L8mBfyMLcvOHia0paHG94fnwDqXA5/RMOzWhg=
X-Gm-Message-State: AOJu0YziDUu2VG8mno2+yh73e38+BII3bQ7r5Ri8/GWdVrNq/4mhFDjN
	GR4gknms4B71np2ogXx2TxO2Ku+TpMUkUhnAhWQN72okp2FuQmu7p5FgPO41K4fw1E44EovcfVI
	Wg+3IKYjyvRGiJlPEnhZo2EKVANM=
X-Google-Smtp-Source: AGHT+IEkaBIuZQ9alfE9AlkTZhoXjlCWg2HZuj9EDuOhb7mtEENe4/9uzIuakQQRBYJlMSB2WtfY0F0+Ye6C5grbjlM=
X-Received: by 2002:a50:d547:0:b0:56e:3293:3777 with SMTP id
 4fb4d7f45d1cf-57c50901260mr781888a12.17.1717727808981; Thu, 06 Jun 2024
 19:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com> <20240506091444.59228fa9@xps-13>
 <CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
 <20240518124732.584f441d@xps-13> <CAJhJPsW9gVe2F1qvxvOkQUX_K1BsK5q_1XjT0u2+QH2gRMNqXA@mail.gmail.com>
 <20240606233344.4e268c04@xps-13>
In-Reply-To: <20240606233344.4e268c04@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 7 Jun 2024 10:36:12 +0800
Message-ID: <CAJhJPsU3foQ_Nr3WhH6nqJZxrK+WpjgJZAcGjGHzRp4K6pfTNw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 5:33=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi,
>
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    oneOf:
> > > > > > +      - const: loongson,ls1b-nfc
> > > > >
> > > > > What is the rationale behind this choice? Seems like the b varian=
t has
> > > > > two possible implementations and should always be preceded by a m=
ore
> > > > > specific compatible.
> > > > >
> > > > > As there is currently no description of this controller upstream,=
 I
> > > > > would not care too much about any out-of-tree description and dir=
ectly
> > > > > go for a clean description.
> > > > >
> > > > Excuse me, should I add a description for this property?
> > >
> > > No, description is not needed. But you are allowing the
> > > "loongson,ls1b-nfc" compatible alone, which I think is not relevant,
> > > unless you convince me it is :-)
> > >
> > "loongson,ls1b-nfc" itself is a specific implementation.
> > I was suggested to set up a fallback before.
> > https://lore.kernel.org/all/20231007-untapped-masses-01f80b7c13c7@spud/
> > Then "loongson,ls1b-nfc" became the fallback.
>
> You cannot allow 'the fallback', alone. But this is what you do above.
> Below description is fine. Just don't allow the ls1b-nfc compatible
> alone.
>
Sorry. I still don't get this.
According to https://lore.kernel.org/all/20221212163532.142533-2-krzysztof.=
kozlowski@linaro.org/,
the generic fallback should not be used alone.
In contrast, the specific fallback has to be used alone, as I understand it=
.
If not, could you please show me the right way?
Thanks very much!

> Thanks,
> Miqu=C3=A8l



--=20
Best regards,

Keguang Zhang

