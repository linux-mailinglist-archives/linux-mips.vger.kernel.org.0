Return-Path: <linux-mips+bounces-1885-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A31086C4C1
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96612880E5
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E655B58AA4;
	Thu, 29 Feb 2024 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wIQcQEDn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F164A5731A
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198244; cv=none; b=JCnrMTIYquGlQSp4fA3uMNh1PfpwK3xPf2WfROjtGt+95aROMkYrA7sdMAG9WdNUrideD8IErTdkezUu9XhaWusxZALlZuebAb5/jl0hfa8kTCGNW6K/co9u0k0iZU2tpk7Ixf6qPUa6q0Ski/Abx1PWE2SVaQUdbImniNoSIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198244; c=relaxed/simple;
	bh=pyMOm65mkTq4KPjGu5e8RURncimpVYdKFWYO5eLhNgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9XMPlDqgHg50NwOdJxK2CdDQgep1OfyweAzb2Hihpgp0G/5rHg4Bb4qCquLY81G8gHVp4NoMClqZDkEIqKgNhFBVBqgxcBs/s0nm+gVtPzLqwLAvrjZXlukgT0sDTuKlF3p943n/0jGCPWBBBwHmlNN+HH1oQrr/TL9dgJ+Up4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wIQcQEDn; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6087396e405so15044217b3.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198241; x=1709803041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyMOm65mkTq4KPjGu5e8RURncimpVYdKFWYO5eLhNgw=;
        b=wIQcQEDnaQmtXyOq/SWlcunU2bk2yuQru4KZawdmWXH96/3SUYIyU8+GDtzBZsP/1I
         hjkR9xuYNZc0kHSuCy14nVy7hMjL6nEXQ/qyGQHAYpt+YifkLhHeuQEjgG7Ksz3+FKKf
         /KXHC+8Z6dvfr3ZLt17ok5psG/ztG0PNr8YgvACDkQplVM4pw48tLLba+ckwDgsLHArU
         y1nqzMSCmbb6erIqzK0e9rbgCIwED7Ujz0uflRJdMsIVDHY3T6QAWVUkFPTlYuUXc04t
         2lgYZWKdj2cc2IP3HUF93l57RXATGtkKVXNo15UKmwVjps9EkMol9eRkxBd68PzUk8Tz
         pRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198241; x=1709803041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyMOm65mkTq4KPjGu5e8RURncimpVYdKFWYO5eLhNgw=;
        b=nAOr1ztpG15XckVhQuAwbxnBnZa5KLjip4PyqKf9awQ2hJgUReSAs25YyDuxiRkiRm
         ZDO7IBN0frQminnSi+EZ3iOmF5nxWugiD4tCIrYKScCCAL0TBb77eL44+20YPQqrvbue
         hEwZ0nCbI7v/1IHNssJMTQdp9RJZQj/Lo6QUBgi6gHGgkH+1kOW3FDlQLKUSx/pruKhP
         4PgBauhzs+AikPnijqiutUuIzsTPyGOqbUeMyRNK+7nJiECL+WqYOraljX23vQFLEKeb
         a6ZcsTpbLw5dsalXoZ6yjSYr72NtgrBsqaHAxel/M6ViFRj9ZC7asoT3gop2+PYu7wVm
         jl6w==
X-Forwarded-Encrypted: i=1; AJvYcCW+Cha12JUkh42ixf7IeWOuAwfeFoLsaF0R41fxC+x8tGDUTxbW66B+xSbZwPmARPFycNTU4eN19B35cRiShwHbNjD5IwTdVaWP7A==
X-Gm-Message-State: AOJu0Yx9E/xvhAhu7mvHJNPzXwZn0wBpUeJpgw93jBK4k288Ve2/qofO
	AAn9Sj0DiFBSV9RHowA4SEAfbJo0tyhbxV2aWhtxJtSaGGoJ2k0AZB6HnxVs4ZKu9x6d737XzHu
	BwvL9KomtGeJ2gR71CHQaYXWNs6oSnJqn9sCS0A==
X-Google-Smtp-Source: AGHT+IEGuc1J77jqIh5A2j3VQGDX6nzcAs4cFbpidh2ExxatqFvQBOOAMN9rR631yhTD85gXsSS2YzVQ6uvvblXyxJM=
X-Received: by 2002:a25:b309:0:b0:dbe:d2ec:e31 with SMTP id
 l9-20020a25b309000000b00dbed2ec0e31mr917083ybj.27.1709198241022; Thu, 29 Feb
 2024 01:17:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-2-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-2-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:17:10 +0100
Message-ID: <CACRpkdb_U_vLypuZFVDwCqSp3EwK0DCR0cOi_MJ=TUwCCQOF8A@mail.gmail.com>
Subject: Re: [PATCH v2 02/30] dt-bindings: gpio: nomadik: add optional ngpios property
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> This GPIO controller can support a lesser number of GPIOs than 32.
> Express that in devicetree using an optional, generic property.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

