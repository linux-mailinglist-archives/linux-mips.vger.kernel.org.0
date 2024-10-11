Return-Path: <linux-mips+bounces-5984-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7078899A001
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 11:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 126CB1F21BCC
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 09:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD4A20CCE1;
	Fri, 11 Oct 2024 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfAv5RSB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8605B209F3A
	for <linux-mips@vger.kernel.org>; Fri, 11 Oct 2024 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728638352; cv=none; b=VYCO518Ky1xAFd4IGpGubCaq67oRUc6fNt1DUfmfJb8SjGmDytoZYtnvhhZ3ic2ee46sWDbybauot/5EgNGdteJ3aEB/UT5f7TmDiecheNLPuP98s0lXtBJeFH7u55EHvKwfLcyagcSP9MECZvw9AjbRX5kyxVjgwaBXnTwIGB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728638352; c=relaxed/simple;
	bh=jtVhZWWNX3zX7CwdFolfALYhOUO1vsDRDytrh8+FfTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLeXFVZzyaAz/++C97LAdbTG1PoXTdpy6OZOLusr1yHRabA4ujsHGqhW6uPTLlkgM6zmGLy2cnei//3tUpOHNF6cH+RpHQSMvwPFFxRtxAPKfac7rbbB/xpFODL8awFAqwpOU4yyw6IQYQzQaTGaOacOXhNw0I4DW5pDtvf/Dnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xfAv5RSB; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac3f1287bso18665921fa.1
        for <linux-mips@vger.kernel.org>; Fri, 11 Oct 2024 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728638348; x=1729243148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtVhZWWNX3zX7CwdFolfALYhOUO1vsDRDytrh8+FfTA=;
        b=xfAv5RSBq1dPqwx4O1H9geUKag4zuOOxK9dpbjgQWNumxT/TLl9G0khO3AvTnJs6Q/
         Fg/q2ldJhTI3V4oBy1BiF458q1ciawRODAKhCxIqx6s4A6emiEY4AqriTYWB6BbcLQcf
         XVPzrt9alzF4Ru1uCJv5QJE3yHPHl3dU2O5d3pWn/17Mqz78ycRZgP9vObcRpmeHJ/ET
         cSc4SIAC8L9IvBFtZKQF+6tFm7KrShhXyfcz8gsQNUg31foj/9bh7yWeW5l3Yio0Q7CR
         sAoNIZjxsXHr5frEI/BL7lOCnzbW+SY2bMarWYFc7uJ/vef1LNPbuU2vwmTmPbRv46f8
         1XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728638348; x=1729243148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtVhZWWNX3zX7CwdFolfALYhOUO1vsDRDytrh8+FfTA=;
        b=tZ5zk9GDmUa3sVmWexxzhWRvYDOTe7lM6QDNJ5HJOAxbf3It0m3+1UrrUKfpetzZ/1
         GZmQAvR/qe1nyFtZaqpblF5fHYNu4lhpTd4mdqKklwRMzyAV5XoZcM0GJa2QPjh8smA6
         0tShCcQHzuJTaezLWguzzHistG34JhJPYzJpnQZ3dQjeBdKLMh9kcnAkTKLwbRBZ4zCV
         A7DMo/BehkWi5te7xg+Qrdan9XwPhJrmurd6lmMJOrtiO3qc+kVuz7/SrdZl3ouWjRmS
         iyG3UVKka3x0wpzu+6d2RZFaAWxpj76rec742/VnWchSn48cRBb1QdiVkt8Jdr/lUIY8
         oHtg==
X-Forwarded-Encrypted: i=1; AJvYcCWh0yRFdlJiSSGeQw2ba+1BGviYHm3IlCDR9ANwUTrKegVWh0g5F58az9yTqjx6mvzkCFh5uxM9AsX2@vger.kernel.org
X-Gm-Message-State: AOJu0YwCoZF9mTKhFwZWwz/2TKam7vzQCeh0i7hvrv6uZ9aTFnPX5olq
	pDbQMSD+GQSXjuXdEQztgKQysWVU//1WvP08Iz+AhHqwruWqhOVrT1hPDQg+FLD0HPk9JIBmDOQ
	D85PQTnVRTO8UDjA/JZo/qETB0LOmgVUu4d92HQ==
X-Google-Smtp-Source: AGHT+IGr3IbqNBTBBoJpOQ310qlh+g4Oi9eFyoyUCTdl+vSPgY4MeKHHQ6RiGRzDh2lAYpqZ3xVkrjWD4F2c48r6rk8=
X-Received: by 2002:a2e:4c02:0:b0:2fb:2ebf:3259 with SMTP id
 38308e7fff4ca-2fb32709c02mr6280871fa.13.1728638347593; Fri, 11 Oct 2024
 02:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006181310.181309-1-matsievskiysv@gmail.com> <20241006181310.181309-2-matsievskiysv@gmail.com>
In-Reply-To: <20241006181310.181309-2-matsievskiysv@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 11:18:55 +0200
Message-ID: <CACRpkdbJ7xh1qOYaZOh+s+Tj_GgE4LXMFuOgL1zpxBRqJQVx6w@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: ocelot: fix system hang on level based interrupts
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: alexandre.belloni@bootlin.com, quentin.schulz@bootlin.com, 
	lars.povlsen@microchip.com, horatiu.vultur@microchip.com, 
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 8:13=E2=80=AFPM Sergey Matsievskiy
<matsievskiysv@gmail.com> wrote:

> Fix interrupt handle loops, produced by spurious and short level based
> interrupts by unconditionally clearing the parent interrupt, even when
> no GPIO interrupts are pending.
>
> Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>

This needs to describe how moving the chained irq calls achieves
this effect.

I'm a bit puzzled by the patch because I don't understand it.

Yours,
Linus Walleij

