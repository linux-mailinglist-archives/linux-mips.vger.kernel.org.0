Return-Path: <linux-mips+bounces-2136-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8AF8740D1
	for <lists+linux-mips@lfdr.de>; Wed,  6 Mar 2024 20:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619A31C21579
	for <lists+linux-mips@lfdr.de>; Wed,  6 Mar 2024 19:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B85140E5E;
	Wed,  6 Mar 2024 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xA4Xk4e3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0051014039A
	for <linux-mips@vger.kernel.org>; Wed,  6 Mar 2024 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709754684; cv=none; b=JvdG+rGt3oeqIYDxn90SKzfY7WTqlr3J0Ttk1C6T5QYNG3TQM/iqA9Sw5fnZou1jeSJM/TplmpV//C8Fit4/H4vMLwVJ0+bVDSG6cE2qbpCu2dORWLjyA3TUsNBgvoFYEaizJ2y3hQ0UKEJMMKWFTGiMnYdbke8tCZgHHyqlQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709754684; c=relaxed/simple;
	bh=nW9BmnqEAJHUUJ1JfNL0w4eR+vbscKyLsSPzdYPEzAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lmwbkIfefZ58809ua6C3T68phXmwHIXW1/ou/Rty48rFqi575nQP6rVqgU66LPgIIebkHfxjlggHj6SyqK49wRMDXW6Rfef5hhNnZm0AXMnNjFWF3GJPhtiqaH6v2x6TVvyaUMBpbF5i4xt55DkeF+45iyWQ5Ml5q8qEXz+grn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xA4Xk4e3; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-609d9ce5bdeso985307b3.2
        for <linux-mips@vger.kernel.org>; Wed, 06 Mar 2024 11:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709754682; x=1710359482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nW9BmnqEAJHUUJ1JfNL0w4eR+vbscKyLsSPzdYPEzAQ=;
        b=xA4Xk4e3RVm4GGIuMqPRlpDCptG3tKvYI9uNRx4ukxYwsl/xKt4Mz8dShk0UjJQ391
         4Nc4pilCuoarvt+xThDIaIfHxe4au8v93vPNBsP5ksvKHmQ2wiaRlWSBWf6Yub2q4MxY
         QqWe9c2Aqrn5I/MymjeocSidpDl+RbplP5nuX7/uesD93S0sf5BQBeeB+JwYfqpdXN9E
         Fx1PhD5xAM+YL6f92wM9rMXpvkV7YuyD0KcjQQOkwGFAQlJPXvz9Kc7CPFqCXAlmtXbu
         MhuJrtZvt2amxjVYlN0WOxNAxMlxubKSaY5+P0kM0BJyIbg7+E3BH+pFiyK2nHVIdhcs
         Ix7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709754682; x=1710359482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nW9BmnqEAJHUUJ1JfNL0w4eR+vbscKyLsSPzdYPEzAQ=;
        b=X+fEGKhUxDXKn3ADE/ffgP68mDH49ayMdI1Y0GM0pu7/j6XINLiBYGEWvHAUAdST4K
         QXEotA8LnYMKuL7gH5u/rv4Tm/8+74vRhXVOk1EpMsRCswHOgjoDXe2rSNREGpsa/vSd
         ujptxnHa8sehKNkLbkPhiS6e5aTXCcR0esmVb+vwRQqMJb5HRS0ON488sCB8+EkZD9uj
         WjsTdMHp3T4dMbF0TdlQUXQSJ2NVCVOofrPkLNFRVMN8Tzc+NuS2hHdCu/Rmx+sTuo8z
         TzwLnNpTeb1zvH6RUT6Q2irItRHtYQ8xFvtLJJvbQbYbzO8nRdGOHenIB9Xs0aVCjtEr
         sTeA==
X-Forwarded-Encrypted: i=1; AJvYcCVmQsMn5Me/T+Gvpg+0nEtVDIwhr1hz8YgqWnTwJpYBz/lxhf0jl6lpAZtIz+0DEf3mIRfbOFXqaqmfd1ApSxkqjIULh4ZCFtAOZQ==
X-Gm-Message-State: AOJu0YwUw7CfZYq3AG+dqmsG7aw1VfpqFqxJtzIUZWZdTlRWFnCfziFI
	F7bvxtxm5aGJ1Qj3sTOqSB0B5vPQ7hKDlTivZPOTboqIHxUUog19Tf1C7ea0cb0sd7g4jvC5ixp
	1h9XJk0+ls0r9Kdf0yYk0/7lmGCTjG4a6ncrv7w==
X-Google-Smtp-Source: AGHT+IF9uPQcyxZOk/shnTMiR/t1t/I0GgpRoKV3hwJiFHCA009EMyndUSs5h2ZUbJvMvccH9zCldItJvubtc7nYbb8=
X-Received: by 2002:a0d:c0c2:0:b0:608:b543:2d3b with SMTP id
 b185-20020a0dc0c2000000b00608b5432d3bmr15502595ywd.18.1709754682089; Wed, 06
 Mar 2024 11:51:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com> <20240306-mbly-i2c-v3-9-605f866aa4ec@bootlin.com>
In-Reply-To: <20240306-mbly-i2c-v3-9-605f866aa4ec@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Mar 2024 20:51:11 +0100
Message-ID: <CACRpkdZqchWA8dKpQq0VrYWBNXL-WxfUSonwdzPYxyvjKhCXtg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] i2c: nomadik: sort includes
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

On Wed, Mar 6, 2024 at 6:59=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> Sort #include statements in i2c-nomadik driver.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

