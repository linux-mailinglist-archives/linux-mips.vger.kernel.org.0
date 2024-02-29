Return-Path: <linux-mips+bounces-1961-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8B686D5F3
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 22:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9F62B26B53
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 21:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA539145671;
	Thu, 29 Feb 2024 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d0N1jv0e"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8510C14566E
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709241009; cv=none; b=ROOe4gRcee1AU869y+it9ifgz8k3Y9prI+Gl7PBUbopPmVLFkc+w4ytOrHM04nTOcGfcAvyDTZznxWzXXg8dRteI6U3wtdunwQLPSJ+9vAIOnWyS7LbuVHZCR/u9nwxEcqkRAJiVSuyf3lcuQLUn+YJ6D8/AOlYbGbhg4Y3KLWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709241009; c=relaxed/simple;
	bh=S8fZ6oYozb5nHV8nQRv8KctbzAfbnxof3VtKQDRYRaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2sK7+GbZQhFHrpWxccoG5YiR+PMYCXeEGAi6rNFrZmggJp7JfvdmdecORWDUyBhYl55SGaFzuc50RNx3KFhKzm6rdzOw9oGp9Zj1Ms2f4n3cjJxXcC3jHQnu+3xtdJHlC4pgv0ZNoAqFUfvI94eCYEZ6diFhfiDOAKzeqb9Pq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d0N1jv0e; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso1542622276.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 13:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709241006; x=1709845806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8fZ6oYozb5nHV8nQRv8KctbzAfbnxof3VtKQDRYRaA=;
        b=d0N1jv0ecE497SIdHY1a0HCti2dEtiEy95GKD6/ZSYIRxqE2CubgluTDIa0hm4ScFQ
         Pa9i3kXtrf2sU8cUdQzxmHsrJpUCJlVxiEtaetaZT+FGb6WCrZEypaM3amhqu8abO62Z
         dFVyfhaGTo+3D/1YFH0G+y7SdNlpDI1SK2tYrIAsELS6Y7B+qDL4odKyrLFPvG3IgwJ8
         nwQQBkm/3KGg1PlfwC1Fk6+8DuQLF29x/LRS7yT0sENWp2U4NMz0rfxTPRpYwyj7sCPi
         aP75dC3/mJKsK8noytXh6w9j6yMmxfRkwpa6tMGGbb1L1CVylTnShJ8Gyox5sbS6kfCS
         oAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709241006; x=1709845806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8fZ6oYozb5nHV8nQRv8KctbzAfbnxof3VtKQDRYRaA=;
        b=IAVDskZ/uCffXApwWF3sgoOeQh9HIpgXRKOSIRcEWVDv076aD2wNP9ZqqGyawLPHiK
         /h5gG/IsiNkXL3KA+wlhWTh9dKbaXqpFl18se/TpUWA+tzk8nw2TT9b+mfyzUENYksB3
         5vigN2/iJMP3whdCoDmbDSIXZ9wpdC23iggoNzwvZ7KxXEH2CBu6PRcm6uS76jjUz7pM
         YxuiXhMjFX8TXtXVf5amS8Fpz5RaPSvZkS7md4jvljxZjRxfBMQuVRrHnRdRKO7M9MLa
         om/bsf8BqJ/l7LISFUa1Go9GALYKztYzntNkua64p/q2jdKfnwUM9uufkNl43OYHHZc6
         ELbA==
X-Forwarded-Encrypted: i=1; AJvYcCWGNexfySYkcYTRGjOi4HG8WOMu6zYrAV6zfVU8ur1kwNaYLb3WMuDY5akiWroKQjUKkFSfPDkTwlwAqOkJJ1OAtuI2tMtQmJOIdw==
X-Gm-Message-State: AOJu0YwKXAn8kgjQ5WKotO/hEVWnNtTnE6C5CEIXtCNDjYFrNBPUC6Vj
	UjCyEudebHrQiG0kqwIvmLjPiRhj0iv8cYDFlbWxZ+oipyNe6PuBOqlIqnrzhdby2xbXFFUjP0H
	5p0qTtAe2n2Ah+jBwtirjNV8rlBhTNjuxJ9bzMA==
X-Google-Smtp-Source: AGHT+IHpqt7WVprMdgDUXDj2HfXpkMExj7EZqboVSsy0vCvMNy6esVauMuDWv/acQi58TDCcoWCPbUaQEY1kCjx06I4=
X-Received: by 2002:a25:2f45:0:b0:dcc:8f97:9744 with SMTP id
 v66-20020a252f45000000b00dcc8f979744mr3219750ybv.43.1709241006597; Thu, 29
 Feb 2024 13:10:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com> <20240229-mbly-i2c-v2-11-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-11-b32ed18c098c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 22:09:55 +0100
Message-ID: <CACRpkdai_-FyXc6+oxLK00Esdw+akg0==YEUv+B5nBcWafN6qQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] MIPS: mobileye: eyeq5: add evaluation board I2C
 temp sensor
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

On Thu, Feb 29, 2024 at 7:11=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Declare the temperature sensor on I2C bus 2. Its label is the schematics
> identifier.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

