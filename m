Return-Path: <linux-mips+bounces-4101-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D1D9253C9
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 08:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B60288658
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 06:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA417130A4D;
	Wed,  3 Jul 2024 06:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xI/6RlKa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C9D132135
	for <linux-mips@vger.kernel.org>; Wed,  3 Jul 2024 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988780; cv=none; b=MJXIP8OnQ70UiXL3m/hYP33Q3otTzJt9lC8Z2GW6MVncz+MWS6kNBEiq/XOn6H7dTtD6nV/PJIF4m0x89fCQdEHJ4xfhaLzpAqikhepRXNoX8GgYeFuZjPug7qEYOYNHXfyaY5rzxjNImg+AoDn8UBIHQAt1vxSsSPxPjtey1V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988780; c=relaxed/simple;
	bh=2gfJcP+dPdB8Ll2+BGwToOilKKAE5E2Ikpq/CZOFF+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOPm1zbsCREQZTmoP+BxF1W8LlDhOgPwfvAJlL4ondbhD3DdtVTifNpjMMr8Ao1EvQIOcB0sIAFvWrhj3jYrb4Ccq5Zg0cB2oXrIv0lXfWcy2S0uJPTK9gs7+/Ehdu6p4AqKVYlL6fic0iROAG8FBgBPhs/U4iiqM6bb3CXyHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xI/6RlKa; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso7741652e87.1
        for <linux-mips@vger.kernel.org>; Tue, 02 Jul 2024 23:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719988777; x=1720593577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gfJcP+dPdB8Ll2+BGwToOilKKAE5E2Ikpq/CZOFF+Q=;
        b=xI/6RlKaYz5tVsdTz/fuXKnHhRs0f/SUvnte34B7w1WIbzfVRho2oLHcsaYu1M4vRW
         Tn3siMniupBYIgHjTLeN81hyWMoAOjpNxHRvmCjNxx1ipnGC5Ia7o6sRwcyFgd60Xn5M
         cFXxK5QpuYI4ufGw5EsS7f9gu4z9R778xVWOZh/QnBDDT+B6s0qK+8F3bVizqd0K9gPZ
         ySixqHO+wNgTKQBWEvTYKO7YGiKOlOtt4Pz4gnSPDC8f+VRrvxRi1qOcN5eXbX2EaHoP
         fJgRmmkOd6Ak9e8VOZu16b371nlSuIag8YzB8/EdIuDI0aXTFwcmMwqZ8oI9hjL5+5ab
         He1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988777; x=1720593577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gfJcP+dPdB8Ll2+BGwToOilKKAE5E2Ikpq/CZOFF+Q=;
        b=df7FNJStcLG4MNk2TMc0tavIuc1A2lDmOavTQ+gcOZDXseJe0WP00m7RV4xeclPo6O
         22up3w1mWGfgyObvijH5o3/mz9B/7MLsRpyJnxnWFy+XqM725uXX8nikuLZgXfZk9fpN
         SyjCupZ7mUjp7BcPNzVkP7q5vC1js1AjvykhT9V0dsZTy5UBb2zvPrSvRBqA60fvkI+s
         /N2QP+gvgUFfjq0dMiJ7aFSqC5fcBSqZAIChQwWaTmtB5OJDcwNJOmwyH8jRbVrQMhwk
         W/j2cEjhQlEFHLriGuOfeqzJJ7wytwyMk8RwEHewMLvr9Q8cfO04m1hPvlxQU/YzcxQA
         WJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDTQmH27A2yjYWzZorCh97OmpTuc4WGr5E6ft4XlqwaxTFGxRvg5V3sA0wxJ3EiAY/Jw/ILh21HH9h3Ng/RlSUQJ69W2AkjVbmjw==
X-Gm-Message-State: AOJu0YylaaAelcWqMQqVj+P8OMr1LGPpOnCRwnYWR5kq1EjfI8om2pG6
	gcKkTpYU5YGNCWvJwG2oEi3/2XDtAIUqT/ftAT/x3O7qbetYLgfyWJQpkVGOzBgz/Pg5gIfB7Xf
	Q3XkID8Gqd0vByvSmkGjUpUFX/hD5OjGiLehtTw==
X-Google-Smtp-Source: AGHT+IHU9DUx6SzBnuSCLTwk5I/hgKcSP3g1gias5lVbToL50BaDFFU6mIr8rhEcT8TXJ5tdUX9Gl+FsVBvHtHEo4a8=
X-Received: by 2002:a05:6512:3b88:b0:52c:7f42:32c9 with SMTP id
 2adb3069b0e04-52e82752b89mr6919968e87.67.1719988777074; Tue, 02 Jul 2024
 23:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZoNAWoJ12DyApZ1s@google.com>
In-Reply-To: <ZoNAWoJ12DyApZ1s@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 08:39:25 +0200
Message-ID: <CACRpkdbS8MDTZLwzM+OFso0-dYg6SwN1NV-tqPdD32HGs3o6qQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Alchemy: switch to use software nodes for GPIOs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>, 
	Martin Schiller <ms@dev.tdt.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 1:48=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Switch to use software nodes/properties to describe GPIOs for the
> ADS7846 touchscreen and the SPI controller (away from using GPIO lookup
> tables). This allows removing use of ADS7846 platform data, which will
> be going away.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> Compiled only, as I do not have access to the hardware. However I would
> very much like to get rid of ads7846_platform_data from the
> kernel/ads7846 driver, and this is one of the last 3 users of it.

I agree. The years of working on device properties is finally
starting to pay off!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

