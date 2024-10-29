Return-Path: <linux-mips+bounces-6546-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AAB9B4993
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 13:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA161F23812
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 12:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309B1206066;
	Tue, 29 Oct 2024 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7DDiZ2r"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F870206065;
	Tue, 29 Oct 2024 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730204528; cv=none; b=S6El1kGq9YgiQk2cTrmbhhw+tE0wdRX7gL5C7nldhWjZ79hsVDFmC1rv44p0jVXDvBn716K12AsQQO1uUt0qI6C6HMz2O96z7/f9Jpqh45Y4zPUYwMnPesMsNFPXgvTreTnC7YV5wcew1x7bmBQ3p+n0sLTczwQD9gsa+H54kPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730204528; c=relaxed/simple;
	bh=vSB6u8bogveL7SZrgC/L5ESJfDxg+XPv+xcOu04Lp9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQU8j8SOondt8yz+JcSZ988oT3xFFdErb3fVRsaWHW38tdkGB/kjiUe27Qw90KewoiMtMzz8fS+qQflREuhIgDJ+yIf1Sutgc/M1XC5SQ2iKuiE2Z6OxLlNm0kyV8ZRIONQVhjQA34h78c60KqaayFfam1ljiQgE9iNGyWqnq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7DDiZ2r; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ea6a4f287bso3427529a12.3;
        Tue, 29 Oct 2024 05:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730204525; x=1730809325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHV7QBVD7QIIPlsLZ6YjaWzT16mKG/opBrn7w7p5NbM=;
        b=L7DDiZ2ryjeuoNBjWfHPYp5KEb78w7Sg1ZNrVk6W5BeOLBxE39qwFqdW8z9QiwDM1+
         xwlRyMg/7QUjBtqWiqRuUfpRnglUndf1mXMUTvfpWTNMaCCaX0Sk5uZnurGGfzIW1lbr
         8Fr2DZkaGkffP1/9fS073snQhwqfBb6MgDCkqT7REnTtUwceBJGJEJCm6qDIMloSW4X5
         wWVOB/qWcz0eooZ555uyJmij6NVFAj+ySPTD+v4KMNr+ha+/f4kmcxLwAZ5IxKXAO/Zj
         glESHmU6pIt/2WCVYSl3yNEm2IRK2tuwUDilw2Wmq/5arqVG7t2H51dVIg7QeWKdGVG1
         28fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730204525; x=1730809325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHV7QBVD7QIIPlsLZ6YjaWzT16mKG/opBrn7w7p5NbM=;
        b=DGcz6jK0i+nqDWt1nGBwjIvrNcjwytECZ2Y/4mu1KBEXmEY/LQZMHC38aXZWZtsaM5
         PTPUemQEKPVrY6Cu9ZhPjJ9KLgoXZ0retFaDaC3FchMx6gPKTg6x+hdy0y/wxhkFC6tr
         B7pcBbPr0P8TR2HmdqfmK0N+45qha2BXrmyKQ+Ypefb0Kv5/bzJon3C1VQ69H/WgJJaq
         xg4ldDyusY9yXbAFl4ua+Fi4Lhf9Q2wlulTCJvTii9o9z3slUs7nBVdgDNOaNjsiVpKE
         oAt+p31C9EFEbBn/HCK7PIZgcgpRe5HjJdHbRfEa6pyKMDwD/0nAnz3B9ECBkEXfj52v
         8JsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbq9qBUoYG5CEJjnFLD2fqNpMsTpL/xhP9eWbBtvzCjQ7Ep8C+ZKZ8Ei4luLL5xYHA9m5jHwoNxxUbKJHm@vger.kernel.org, AJvYcCVcVosy3qcwTp6C6P6eBNBLAb8AN//2bFLMwNLRTDGuhPPP+j/G/zz47zshmc2Y6UmTLQc2KVGh1QPJ@vger.kernel.org, AJvYcCWbBm2ndO4AJkZ3dJYl/vT6d00ZCuDdzykc1nNSeDVLqO6gaiH5h4BBKpX4+ujCWjCiBtnciixmyTzSow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyodholkqmBOSvpzQBIlRDCWvfEW8Z2wE902c97DzvEK+aVRvsZ
	CvVmEUm79zlnFd3DBCD2GRkDeR66TeEbIIOcQ7PVFhcsDA/ohPjv3suTVWf8y4usvDLtRLeCb4j
	A92E2dMijIQ41mxLe8qEL4Vvz8hk=
X-Google-Smtp-Source: AGHT+IHLIndC2lOUKpJmDfcwYz6ihXRGTPUV9yyYVkIsLE/O6iP/CZ2Hhr2+BylMbsHP2hzM0mXo+TV3dR466se5jdM=
X-Received: by 2002:a05:6a20:1594:b0:1d9:c56c:4a0b with SMTP id
 adf61e73a8af0-1d9c56c4aa7mr8579387637.1.1730204525421; Tue, 29 Oct 2024
 05:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028175935.51250-1-arikalo@gmail.com> <20241028175935.51250-11-arikalo@gmail.com>
 <avz4crm2yrk3fg7r4qxkgkt3ka5hmk54v2wtcms453tsnewu5w@jzjxmyd4b7yg>
In-Reply-To: <avz4crm2yrk3fg7r4qxkgkt3ka5hmk54v2wtcms453tsnewu5w@jzjxmyd4b7yg>
From: Aleksandar Rikalo <arikalo@gmail.com>
Date: Tue, 29 Oct 2024 13:21:54 +0100
Message-ID: <CAGQJe6p6QgSQKByVQ8G+HpWbdEHnfNb8vRureOrS2VZa6Lk74A@mail.gmail.com>
Subject: Re: [PATCH v8 10/13] dt-bindings: mips: cpu: Add property for broken
 HCI information
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Theo Lebrun <theo.lebrun@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Chao-ying Fu <cfu@wavecomp.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Paul Burton <paulburton@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Serge Semin <fancer.lancer@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 8:03=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> > diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documen=
tation/devicetree/bindings/mips/cpus.yaml
> > index a85137add668..57e93c07ab1b 100644
> > --- a/Documentation/devicetree/bindings/mips/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/mips/cpus.yaml
> > @@ -47,6 +47,12 @@ properties:
> >    clocks:
> >      maxItems: 1
> >
> > +  cm3-l2-config-hci-broken:
>
> Are these names - cm3, l2, hci - obvious and known in MIPS? HCI usually
> means something else - see drivers/bluetooth/ and drivers/nfc/

I would say yes. At least the name "CM3" (Coherence Manager 3) is
common knowledge.
L2 HCI (L2 Hardware Cache Initialization) is a feature of CM3 that is
non-functional on some systems.

> Is this property applicable for all MIPS vendors? There is no vendor
> prefix here, so this is generic for this architecture, right?

I'm honestly not sure if this is something that only one vendor will use.
Theoretically, there could be more. Perhaps Gregory CLEMENT can give a
more precise answer.

Best Regards,
Aleksandar

