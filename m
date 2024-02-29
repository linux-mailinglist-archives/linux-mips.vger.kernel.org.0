Return-Path: <linux-mips+bounces-1959-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D257786D5EA
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 22:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 885F81F2282F
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 21:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC34713E7F6;
	Thu, 29 Feb 2024 21:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fzs6N6p3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0462313E7EB
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240945; cv=none; b=TcOiPiYBuPi8dn9oLBqBmxN7aVY8ftQaCPUr+n/oqzSBaISrwiSDO2NK5E9HmJS4+Jot+1REgXKcGNTVH8ZAm9dPAFyhDH0uoyq+Cy9up7NOdPsQsxo8IK8/xpHdpza3s8JxiPrqDvxLwQ0xXtoJObumThA3QFRq1bRjCEPh2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240945; c=relaxed/simple;
	bh=abpgfmAPNQgCdMPNqKx7nKf6Y9+2suZjGsQJq2RC0wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVo6GCVtkwj7wvtzoaFnHChOFJrw4MQPkEAt3CzoEVW6GkDOLnyjpYgOhnDIrT+C3BWUNSwiVn9cr+Sk+H3GYZkOKLhAKP9dGTn8KGlKSKM5ThjqqkaLXYJAaQreBWCQNbOK/qrt5ZRzHv0UTaWhi/JkWsXmxYWYLfvbBTaEnlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fzs6N6p3; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc742543119so1530396276.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 13:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240943; x=1709845743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbAUk2ubZXSXJfkn5aB8LTduIIAz+YJ7H6WyL+sPl1k=;
        b=fzs6N6p3MIg9WyyNS/K08SDeuPHhxJvs9w2saj2KHNSUQX9caSXKndd5QOx59lN+Fh
         QdgnGKWSk0zpI6bh3O8f6wd4m/ygBg9LTx+OlybMm1S4SfkDucnwo7ca7gXzLekzHHYi
         n6WiVUMFVBsRTHSr775WytAB1PrryURQgoGWp6wn2XBBMnnbr1uvEQOS8fgHKiqcFHpP
         heeWJw6dyL+6jZbNJU8FmliUIWZtZxw/6847n3lrhxeI3/xw7Ts3iabQxZECh6FOkbmM
         2jfdV/yie4/2k+K4gaooYS0MjnMWiA0qpKbZcWRxl2nzQcTlQrDzcbvyLs7UP9Ucv/CB
         PoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240943; x=1709845743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbAUk2ubZXSXJfkn5aB8LTduIIAz+YJ7H6WyL+sPl1k=;
        b=TexM5Qr95hA8ZAZEo9biQEVfPnnQyooACTMT8F7tEiMTy6UqSY2EIKrOwB357LJXnS
         czuLT9tQtGwowymxXUmmGu6zPkSRWXRXqxvP/2FXNjiCGFFP87HuCXfekIZ4T/GLoCVy
         dGqxMXv2XMnLyuuPD/bQDaxxTWS5T5POoJDtVJAt6rNcOj7WjCdt0dKDI0xhhDanVw3r
         A05C/fDsEkqIphgzSj7hCdrCgmMo4vRrKn3pfguV9Jx7MnZQzUnsImT5xsnkXHmVyiIS
         KlC8KS2c9hxXAEHQs5DBoeroZf0phXZyznVShq1ouDQULhVhQHxDiuXRNlqDWc6oHM8a
         KAug==
X-Forwarded-Encrypted: i=1; AJvYcCXgZ4Imrp2g77SehsLfimXudCoiQvk/8ngympsuC6wR+WV2pFO0AjQVIBbAt9BNTE4LukKYF9f2YrL0lnKqwhTqBH6yFZA+5qz6gw==
X-Gm-Message-State: AOJu0Yx0XdJNSdtvk7gS8uVnMrVQOoMTqDrqOQDqVTKJv199q1p2Hhbl
	cZ/KH3RrC2xFqeGWs6ISzBZ6qZy8+NpZzk468WxHvwVO1oC4yRV+Zeqif17eXlDSeZUAxrdDm4r
	O6QyNHh+9V651f8JK0vy022QMkQ24vsXuYzgp+Q==
X-Google-Smtp-Source: AGHT+IF8ln7WLyekvHJT3gKVoSoapL6K1womt5rWIbJrJz0MFoc/wyxR7h/qIOW5MqZBupdkc++ChmM9DDb81ZIyLKM=
X-Received: by 2002:a25:a2c2:0:b0:dc2:3279:fde5 with SMTP id
 c2-20020a25a2c2000000b00dc23279fde5mr3677872ybn.22.1709240942644; Thu, 29 Feb
 2024 13:09:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com> <20240229-mbly-i2c-v2-9-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-9-b32ed18c098c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 22:08:51 +0100
Message-ID: <CACRpkdbaRy-=p63Hq=ykSUeQ-R2S=DjqSBV6-GQWK4BRJNy+iA@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] i2c: nomadik: support Mobileye EyeQ5 I2C controller
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 7:10=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add compatible for the integration of the same DB8500 IP block into the
> Mobileye EyeQ5 platform. Two quirks are present:
>
>  - The memory bus only supports 32-bit accesses. Avoid writeb() and
>    readb() by introducing helper functions that fallback to writel()
>    and readl().
>
>  - A register must be configured for the I2C speed mode; it is located
>    in a shared register region called OLB. We access that memory region
>    using a syscon & regmap that gets passed as a phandle (mobileye,olb).
>
>    A two-bit enum per controller is written into the register; that
>    requires us to know the global index of the I2C controller (cell arg
>    to the mobileye,olb phandle).
>
> We add #include <linux/mfd/syscon.h> and <linux/regmap.h> and sort
> headers.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

