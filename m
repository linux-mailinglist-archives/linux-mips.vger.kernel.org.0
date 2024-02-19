Return-Path: <linux-mips+bounces-1556-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3637285A617
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0B9B1F21712
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 14:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2450C1EA91;
	Mon, 19 Feb 2024 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGh6izYw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26163383A2
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708353356; cv=none; b=oVUlpxnW328tUufLaVZG2du+3ZWHoZoRu4JLBSYek7FcGeMYb5cR4uY3QOaMHChazA39A4qoJby/yROpPsxymU/pAnhY/31mLVjhjPTGC17uGirzlMmcGwttTBQylAr/Wu/wihR9+wDMVegFFbYHeqxckuGSMoS5tQe0adpTRBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708353356; c=relaxed/simple;
	bh=1RkS6CvafEx+T4LVSMCS6FBn6mLD7Rqrzm5hwLpeVkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeZmFriYqn20M9EXPlVD7PnaBzn5Nm040UsbqMM9yQiwJFSQD87u5R/ZNzdrmOM9SHaLXmXvqUvWXMgFQr50Kbf4/3CZrQeQgvuDxXR5UMzu8N5w39FmDPiIVYLrR2TbfLF+WQmLROPZJZy1XZKv0bVuu0YJQOKRa+VH4FksySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGh6izYw; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-607cd210962so36422517b3.2
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708353352; x=1708958152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEbqbxunOK1j7HlndGF87g5ivfAom1/PXvbiALIF138=;
        b=GGh6izYwiyn0/JNsol6uc7v2uVUZgYTerVNlzw0aG7duOty0wRLsDcc18MHQOw1AxD
         vjSUKeO4kPeDphY/IPJcxXjnou8vF3YhZ3jtociqWxoChE1xJQY96tneVdbMPIM8icsN
         qVEudVi90OCVL+IOK1y/PFW7D7frJeoz1bISvLkpuAhyr5jjoj3KkobJ+ozfH47sq8XI
         VCAaDyB4YXRu2TJBX4uA7z1ZxQlpDtQPPSLyDkKo3eZD/oLGPdruWkFhMhw9tynSHIJM
         1e2hjpq5ajN42q8E8xENxA7t+kzZmeOaMEWthnG70ptklQE7NBehuHKpEG0JN4aNYAT3
         SwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353352; x=1708958152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEbqbxunOK1j7HlndGF87g5ivfAom1/PXvbiALIF138=;
        b=axhlNvX2pI8XWeTCq4EYmpqFSP95VoDZBUrMHdid/Ylj7pRtFl9Zu16cblV+lVgY5p
         VR4Hw/fpQUBYAgIXnKGX3hHW1rLPIU9sHW/npCoVcIxl8YJ83HLhteCZYG11hEy+ouxl
         aR4XPsb0WYUUUnVEn5SS8oIMzEWRIeX+dKmMCjUjr0M7YfWlAMoYL0kfNnfj3MibRA0k
         CqVhas5SZMlR90T3YSptnLffablYC0CyvjFUTpQ3/5qw9z/f0pmTlm3ebaCfe8shAxgu
         ggSUnVLVfzw8dpBXkilDnGzTwjnphNQq07UAPHKEfH9LydT4hVBJ6xtCgXHkOYkHMG8V
         Cu9A==
X-Forwarded-Encrypted: i=1; AJvYcCWpRUsyHZeUe0w894JwrEpf+qmzPs66J9awcNtbUl5Sdec/KWf74qy3CW625VpiDfBbHXrK2vP+d/FHaYao21FPcaDmNfJlHgNIGQ==
X-Gm-Message-State: AOJu0YxDVI+yyiPyXKhg6g79UGFfeCXQW6mD6jBPOzN/5F+8DflZemUh
	Nv0o/8JuAfGbroT2FXFz5kP2wS2dOE8qApnDOhO87kEtVofxM4XGYI1lBPRWUsy33agtnf8vpMe
	3LJvU5QUXO+Gos/NJxg4CMp3Cuj7uYSDfkjbBVg==
X-Google-Smtp-Source: AGHT+IGXXWQTNqG8Av8Wi3KkHvfVce/Gy7zDUqiCf6vvsiE9KC1FnT/C640OvVmyfKMnPiIRcy8xDE5EYbmrcdB8w+g=
X-Received: by 2002:a81:4885:0:b0:608:1cf8:bfb2 with SMTP id
 v127-20020a814885000000b006081cf8bfb2mr5252664ywa.1.1708353352208; Mon, 19
 Feb 2024 06:35:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com> <20240215-mbly-i2c-v1-10-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-10-19a336e91dca@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:35:41 +0100
Message-ID: <CACRpkdY4PtnWkAEa=8sHdx7zYXLVAsrqKEVJY9m7VqeG5h6ChQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] i2c: nomadik: support Mobileye EyeQ5 I2C controller
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

On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add compatible for the integration of the same DB8500 IP block into the
> Mobileye EyeQ5 platform. Two quirks are present:
>
>  - The memory bus only supports 32-bit accesses. One writeb() is done to
>    fill the Tx FIFO which we replace with a writel().
>
>  - A register must be configured for the I2C speed mode; it is located
>    in a shared register region called OLB. We access that memory region
>    using a syscon & regmap that gets passed as a phandle (mobileye,olb).
>
>    A two-bit enum per controller is written into the register; that
>    requires us to know the global index of the I2C
>    controller (mobileye,id).
>
> We add #include <linux/mfd/syscon.h> and <linux/regmap.h> and sort
> headers.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

(...)

> -               writeb(*priv->cli.buffer, priv->virtbase + I2C_TFR);
> +               if (priv->has_32b_bus)
> +                       writel(*priv->cli.buffer, priv->virtbase + I2C_TF=
R);
> +               else
> +                       writeb(*priv->cli.buffer, priv->virtbase + I2C_TF=
R);

Are the other byte accessors working flawlessly? I get the shivers.
If it's needed in one place I bet the others prefer 32bit access too.

Further the MIPS is big-endian is it not? It feels that this just happens
to work because of byte order access? writel() is little-endian by
definition.

What happens if you replace all writeb():s with something like

static void nmk_write_reg(struct nmk_i2c_dev *priv, u32 reg, u8 val)
{
    if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
        writeb(val, priv->virtbase + reg + 3);
        // if this doesn't work then use writeb((u32)val,
priv->virtbase + reg) I guess
   else
        writeb(val, priv->virtbase + reg);
}

and conversely for readb()?

Other accessors such as iowrite* are perhaps viable in this case, I'm not s=
ure.

Yours,
Linus Walleij

