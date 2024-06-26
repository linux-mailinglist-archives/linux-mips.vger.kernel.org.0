Return-Path: <linux-mips+bounces-3953-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97567918044
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 13:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91331C23859
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 11:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601831802C1;
	Wed, 26 Jun 2024 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7MzysBI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07D817E445
	for <linux-mips@vger.kernel.org>; Wed, 26 Jun 2024 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719402839; cv=none; b=UIHqYDtPQwV01pUJi3KgpbZbnphPhzfgOClSMs3HYngKYpPCBIHbUYIuQyRQgqhJ++oMVfBhMuexsVJPtajcq16o07o3G5YCfueoTU5qm8zXvzN8som/MShhRpsCMKH6VRKS/x4/TC1Q/IQ93H0KhxM2+761ve73XvfXcRAWQLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719402839; c=relaxed/simple;
	bh=t4QnQiAAvKS4rt9+w5OINOMssi64SFHO6cDlDm4yBRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvsT7Y3lJhGVjJ7VPf2/6kjx+BltDZJvBqmhWCK4fQDFCDqwcqHA22lGQoent1SdB9uN2jUbEjtMv2GveYrM+05ZQaaDX4gnJj3uMJKOB06yLv4ykxyUH893RrX0NwvUjCOa8e95De891Rbf+3OCDO8CO15HNvnP59f6BoXFUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7MzysBI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso5059815e87.3
        for <linux-mips@vger.kernel.org>; Wed, 26 Jun 2024 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719402836; x=1720007636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4QnQiAAvKS4rt9+w5OINOMssi64SFHO6cDlDm4yBRM=;
        b=Z7MzysBIO35fPlQ3y4WF8omYoXMvdMqCx9APq80vkLyeug6M3jRguoa4/o0pya2FsQ
         jIheL0Ywr8RSR3+ziLyOy3gH3/sypkPG2oFw86/ZcFEQzcZCt5mLUJVYQnrYblXGJoUH
         RotHINvv1inuaeT0gxg/+xzV2IrQaEXmQTW7Kqs1M9KSUMv99IGQkmKdZy4hbLNecqms
         TD+tZN1YrSwoPmzr6/T8xaw8ghKkROi45mBFDhXVVS0qQAMkTB63Mr/meamWxyDg9RR0
         1B52+mqwK8W/NTxVSPpxYtR4x2XRKJGTWjub4k//CX3onckOld+qaPLrJe0Lvd1uBJvv
         hxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719402836; x=1720007636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4QnQiAAvKS4rt9+w5OINOMssi64SFHO6cDlDm4yBRM=;
        b=O8ockeK3l2We0bJ+RhbOwfShzLZGASLAsCp+X2o3QBjTBcS8qyPkeV/zoeWPEMOoAc
         SyyY5TY+vhbCOMKtHuM63sezxLVPUlSr9a4XISlGHdHizg4N75LlY1DKStDqBdHBS0pi
         QF1at50Txhl7m4dANWiZMMEob+ez8V2iHun8Y5pARRC+UUUcqQDNI7WLtdx+4wQmLfOG
         P5h9DVfllDU/bmknWIVLgtfm/xRoijEs2V1Wh7HOYV7ikmo56raJqFM9kBxNTTZHK4BT
         JkiKZPVlqKPFN+U44yEl0soH+lGRlgpWrYWNpPwF4QfXrI7aZwFjVwzz79Ln0Rgpa5bi
         4z4w==
X-Forwarded-Encrypted: i=1; AJvYcCVcb8FZBD5wHHWiwm/dLoi72tY6Db6Qiif32pVfD1yESwzo3+RcklRuYy8RvipNnRyQ+PaX4tk1LfIM60VWxGGGO7BlbEib0VRl2w==
X-Gm-Message-State: AOJu0Yw58vTB+236GBo2xlVaBe3ldgn3BylxhRC5uSnLQU64laQ0Qf8k
	ln8V6xysI2sgpjw1FC+eN9pMsRfXng4kV1JeJXzyuVa2qi7BrgEXaUzOGOI+4xG/rwbsw27+bmU
	bRPNk2hogFx+y0k7jwBjfE7Weq3sNx21qLYfMYw==
X-Google-Smtp-Source: AGHT+IHfgQa2jdl41DM6WUs5TR/l+YzB0+Zt+uOHmxpLnkmqfkC8JZfrxv9WacloodOw0FsYNj3nJp5iaAX+hw9hdnM=
X-Received: by 2002:a05:6512:3a8b:b0:52c:e402:4dc1 with SMTP id
 2adb3069b0e04-52ce4024e00mr7078665e87.55.1719402835840; Wed, 26 Jun 2024
 04:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com> <20240620-mbly-olb-v3-3-5f29f8ca289c@bootlin.com>
In-Reply-To: <20240620-mbly-olb-v3-3-5f29f8ca289c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 13:53:43 +0200
Message-ID: <CACRpkdYLz3vMbft8dh_=dqd-yB+YUsbP2jbHBXGnUPZq49Mrug@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] Revert "dt-bindings: pinctrl: mobileye,eyeq5-pinctrl:
 add bindings"
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 7:31=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Switch from one sub-node per functionality in the system-controller to a
> single node representing the entire OLB instance. This is the
> recommended approach for controllers handling many different
> functionalities; it is a single controller and should be represented by
> a single devicetree node.
>
> The pinctrl bindings is removed and all properties will be described by:
> soc/mobileye/mobileye,eyeq5-olb.yaml
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

