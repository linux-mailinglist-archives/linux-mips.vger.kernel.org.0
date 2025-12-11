Return-Path: <linux-mips+bounces-12450-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CADCB67AD
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 17:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 677B53010FE2
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 16:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD941990C7;
	Thu, 11 Dec 2025 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwFNubfm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BFD2773F
	for <linux-mips@vger.kernel.org>; Thu, 11 Dec 2025 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471160; cv=none; b=WaaayQ/0qQBxvovgJfHa2IQnNSviIt2vKwvGrhFeLdCkgtZ60dgHzlLyiHTN6PDGheSGh45dlYWOu9v5gvDflARenIcnmkOYs2xteTdjA/rnZ0YJxIvfhjux0ACc7Sc7Guk3BE8X/JDRWY1s5jTumDstgKQafWja9FWlq2WxyRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471160; c=relaxed/simple;
	bh=QqafI8gITgT/TyxeGtSBThu0HXrZeCKw789puPemHiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qiFOh8qYlP2NFVTljc2aPAHox1DT/ncEYYC3wUEBNRi9sqLso7nrWUulHqJOo1HztXQ55nTyEArLjQZMzbnTBT+VoQQs/MukMI25SAEm18jRB8djXQTqWxBi+QXygVLxdxBvBQMmFrCvDMWknxIYInDTrejAi0lqlbEXX0DCHPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwFNubfm; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37e56b0712aso3285411fa.0
        for <linux-mips@vger.kernel.org>; Thu, 11 Dec 2025 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765471157; x=1766075957; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqafI8gITgT/TyxeGtSBThu0HXrZeCKw789puPemHiU=;
        b=hwFNubfm6kIc/vUpyaVkNdpjcU564plltl7pfk9D57tWx2C9mIYm7eW0nOFB8kTCuU
         6BYrgLw0aUZGld7ee8Uk/C05cNy6VQmVgrjRgktzNJwv1N4JVUmluMvYhYXa+vCJs9NO
         9dlkO/OYhBxlFGqeCPWwZe9bUXdenwaQvHzH0r6QT7eDmhEOD74yO1pABeEPlVBnhCxX
         BpO92vBElMcfVPCohlKU5IUaHMm+wLBN9zccr7UEktEsfGo3QMsQWAKSyKXDCwUtDDIN
         iLxPlm8su3nbhXGTwle4jWcZ+8mAG3KSHa7ByjrEGI9QVXfRNCJJNFPq+APDh+Atf6+q
         8ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765471157; x=1766075957;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqafI8gITgT/TyxeGtSBThu0HXrZeCKw789puPemHiU=;
        b=IEJwrB/8nZh2A+34wCxJ0lO6QRUAw3VqSLKWX3BDvYFG5EteRwCX1s3U2cW7q4+MUR
         XCJu6pZ7sZ6gb0ShkKD9M3yijahmeiMbyPbmz7pIGOm9EbJoITOfkyKpq+16b5+bwi2A
         FvQnPvtDt7SA5L34ECRdMGJ10kx/23XBCXf7noXBEKjKOkG1/MHWLxLq8S5QeZq4Pw3d
         +T7/9OemFyGLABxgXUF5bnObE+BxLIdry/FDt1oDSIL1xG/ayeX8vyEX9PGr4U0uHnoC
         /pidgB1Es3/Ma9qX8CxxBZWdfN3ZpE8XEbiIUAg1495nPlOViAWIRD8LB9/S99AFCW07
         TSLA==
X-Gm-Message-State: AOJu0YyD7fu+GUagxN2b9W2hat2+N+97bl0Hy1AZQtNVNzopqrBbX8Ay
	0yTTVmhim2VM13dQWrFtrAY3pWHnBeHEoTmwpjL325vYoPdjDeEDYxmET7KsBlvimMkVtdL22Y7
	7dIWljJ2G4Fly2OjLWlcp12s3QapMIXHOyXqkFLc=
X-Gm-Gg: AY/fxX4+YoXUTk2JgE4MLWtJAGXejEqDGYdb56FhVtbKHxzOu8kWdByPIsBuup69a0C
	N8oZzq9WH5E0ZbwvXgM1f0ooXTcFTXLjNIqqcCFI806TKt2KMbX5510Lo7G2/wMy5V43Z4KV3Ag
	eKcND0OqBkZLJ3gXE9fRa+IaNGbPDVSx3Byew1o3LCucYup4j3Y0YK29q+Y+LQwS/ua57IVeyD/
	M+QBEBgUtFMD61pVkSF2DNWn+NJLpOT7xQTKA6tstVkunc4cPo9ZrNcGVZQRadMGtl8gSGr34jz
	8FSGeMw0DHKJ23ctzXaItNo9WGUiAXj9npuTqc4xjMislK/TU+Z1zxYV8qr5S81+HpFAuJp2qDx
	e7DzUBT0sTclic1C4Uw8VHwZIk9A9m/LX/M9JdBE+n8fXN0tQbjmLUhdXRaWrvPA2K41d33ibof
	EonfhWIutoJR0=
X-Google-Smtp-Source: AGHT+IGX/SMAvuE7gHaft1l/GtnQ4mvsQBfNCft2T3u0TnDdCkCK6Qgns1kEkS9E1r/sOWbDpcBee1Mq3QrHEIyGRdo=
X-Received: by 2002:a2e:8a88:0:b0:338:8:7275 with SMTP id 38308e7fff4ca-37fb215491cmr19639531fa.25.1765471156479;
 Thu, 11 Dec 2025 08:39:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOoiW7LwuXB5o2iPtVs4gDDoL3i9vFK8p=rg_JHfa4V6vraObg@mail.gmail.com>
In-Reply-To: <CAOoiW7LwuXB5o2iPtVs4gDDoL3i9vFK8p=rg_JHfa4V6vraObg@mail.gmail.com>
From: Hunter Rules <huntersschoolstuff123@gmail.com>
Date: Thu, 11 Dec 2025 16:39:03 +0000
X-Gm-Features: AQt7F2pBessnboHNPFuDyn-XLnIGm-kZUK7mSL-L72LUTG_7ZkHfipma0Z33iJE
Message-ID: <CAOoiW7JurfCCFUQxvB-MfLHANMLPCt86LFPL2LgxNMe1q_8ugQ@mail.gmail.com>
Subject: Re: Attempting to extract a embedded Vmlinux Image that has no .ELF header.
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies but the top part of the email must not have been copied and
pasted into my email client or spellchecked wrong, its good to see the
core message still remains readable though. Also, no, I did not choose
to be named "Hunter Rules." Sorry for the first time rookie mistake.

On Thu, Dec 11, 2025 at 4:28=E2=80=AFPM Hunter Rules
<huntersschoolstuff123@gmail.com> wrote:
>
> Im trying to extract a mipsel VMLINUX image that does NOT have any.ELF
> headers, but it 100% of a valid vmlinux binary in there perfectly
> sealed so I can run it in QEMU (the 2019 version of QEMU, as mipsel
> kernel support no longer works on modern versions)
> https://files.catbox.moe/55zxkn.tdf
> Original name is AppKernel.TDF
>
> I know for a fact that this is a valid vmlinux image, None of the
> infromation is compressed or encrypted. However without a .ELF header
> loading this is useless. If possiable id also like to see the config
> options although not likely.
>
> The kernel is based on Monta Vista although it is pretty much the same
> to most other distros
>
> For reference here is what a valid Vmlinux image looks
> like(https://files.catbox.moe/55zxkn.tdf)
>
> If any linux wizards out there can tell me if extracting the config
> options from this image or even getting it to run in QEMU for having
> the same exact same arctechture would be possible. The actual VMLINUX
> part is 100% there and not tampered , but without a proper header it
> just will not open.
> Thank you as the reason I need this opened is for a operation im doing
> that's really important to me.

