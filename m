Return-Path: <linux-mips+bounces-14143-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI10EbUq3mmSoQkAu9opvQ
	(envelope-from <linux-mips+bounces-14143-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 13:53:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C353F9A2C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 13:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 868043045665
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 11:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B7D3E5562;
	Tue, 14 Apr 2026 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tdwna6hw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4193DA7FD
	for <linux-mips@vger.kernel.org>; Tue, 14 Apr 2026 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167513; cv=pass; b=PR+ehhVu2Gqdyz7gXCW1bzmqijCNK1Wl4KAcsSBE4dOq3S80mkccLIqv6hl9rzpKG7GW4IqTBAuE9ffxMreVQCVHT6hMnTtBgcE6ybaVCDrUM2aDGTDZdYSnYEVazUrdEchXf8yJn+rz2gw1wBu4vq3/LhZ4SxheUzkpt2fDqUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167513; c=relaxed/simple;
	bh=MSQdTqohWprHSSGxPUw63cRNJJ4jH1n4U88mAvfhB0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srXne3fg0zLgDTQwO9S8zd2wtHDZwpjeXIU1HmZuqr9hhtzlVPRsq/lIXdRG5w7BbOH+4fKQePYg4eAXOZi+ItPZ/KGwN7yJ6N+KgLSZfbMdPBHi6UNp4HKLYgGAuJe6inMEuEeZY8pYw0CI0jLgKkI2luyEyFq9TCki70cbP0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tdwna6hw; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-651ce2484d5so2160662d50.1
        for <linux-mips@vger.kernel.org>; Tue, 14 Apr 2026 04:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776167511; cv=none;
        d=google.com; s=arc-20240605;
        b=BWXtQXswrz1yB71A/C8laXmVBgINZLzV8lcnWhwPAn/IAg5NWrFU7z5VyLZZA6nxHM
         DKqmxH6+aZuoxzLSg4SuUJuSG3Knznfq4uaiopQQd9Ayt9vzXWwrdayD4SZGJ2Z4R5MC
         k8dHuVmH5jASzYM3BKwwxd775nBctLtRkoKOFFTsdbYXymGpBLYKcY1i4OaTQAcAC5bX
         I7oH6bYN3KEDqRD4LgoUDMywmPZVus730ZHtLNZWtaxAsn06DFgy7lyngPsN0osh1rGc
         DcNWfp+57Xr6NlhFt5CO9xjmp4KDU3SExGFIYCAw/tvykCaYWs6040aXe6KuOidfwCfM
         P58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nsoXP8uz7XDMohejorwTrPXwgpEvvkD5CIJw+jNU9jE=;
        fh=Ke+1mFYp+eoE1118EfRzqw+ynoAqWet75BgZ1VGQC4s=;
        b=Q+GiBTrm8nol115GohMfP1cTqU/oqOppAZ6uaY9g+etbRzn3Bw7mm3ibB46z7OF2t6
         G/cH4Yg7qxAfr2DgjH7kmC8QOQeMcygZXwLdgQJRVA43lcVPg6h5bEfeC+Mr44/NVcp9
         ecPmlk0ejtgBAk+PMPY5zk551jKfdtc9bvDVjthGBkg8veDbL7KzmMnQ2AVU+i3Vg2K+
         sifzSlftP8dRGNt3ZwOlw/cdjo+9WCMq8knSM/8Qcfqj2fbz9aQd9oDCxd/xyQYtJyd0
         Y5sg6ncgJ++/HIC5gWDqE8PXF5N7XdRXtyilnY8Mad/bQLPxm4hFQbj+YxSX2W++yBq0
         TA1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776167511; x=1776772311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsoXP8uz7XDMohejorwTrPXwgpEvvkD5CIJw+jNU9jE=;
        b=Tdwna6hwYAIB8yoLcNRMbiiVtVJiErO5uglUlLXPyiUNW+lGyjuzeT2AIUl0AGATGh
         v8enquRi6EoviLglLBQO8Zcvcm0Spv+kFQNHYuYe7tOJHZa5KUmZ5Cmy2/RLbXZ/Nk97
         6o/MbSVIKIU+v02JsWO1F8tHGnzj8RP376KRWTSV9xUBj0scFAxXKzh10kxtU13Puhz2
         2aFnpqIM7U8DQWeiEX8Fiv9U1IMv+twmlW4zTpppI+S28PyBUkSG7TKN9ojQ5KRu0Qjm
         T+I7YMcVigs6DPmOC43xrHv0aiEJEWPxCMFBvQyRZVgg9E8HokCIMxcp+wbTe35NcAFy
         tBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167511; x=1776772311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nsoXP8uz7XDMohejorwTrPXwgpEvvkD5CIJw+jNU9jE=;
        b=rqxcgb/i+XMqzUANuNzRUdTuBiDvuZychdbbU3prNre7HT+CODcfNLlQlSQ4wHccsx
         +M13IXlZ8UXTJBTRvj+XNh2IZj9e1ZuZs33qLRpLEF9NrO7QFPm3JNH0sjUqaip5e6/6
         k9gMOQ8GPq9deV30+KHtYhyAzWABeDY3HO9/jJqNcqFggPnCNftHRnclFfCK5T+d/g4a
         7f24P/o4DUO7mweJT2xVhWdhHIMroMFSPAWxntxk125iipdezyZhUMW0CqcRp91pVrH/
         50BQn/eKVU7KrV+tS1ku7Zkk1g/cKkl582u48ns4foJ3d/MAxSod1Vfrt2L0yChCxXTO
         wjpA==
X-Forwarded-Encrypted: i=1; AFNElJ92Q7oJYTkzzFuSVjOh3n0sQ41o8DkMxe8umGTu0S9ZnxFkjQzX4HTtbgFQ0FdahMrIUcYRhKa1R2jk@vger.kernel.org
X-Gm-Message-State: AOJu0YxiA0Tc82tUGv0x307eQ9pQ+OIn5jFz+j4SrFf5JeCdRjqu8XYe
	xLZdZIEn7lTNoALlYdRsGj6/FafnHsPPEH0033wy7Z+KQsxGfuVmIkkAAoV4wbOisZlkq3i/UbT
	BwskJc7uR3X1AESaZN3QU4Cs8gJdLSDw=
X-Gm-Gg: AeBDiesWYnesACTQWQFvroc5we3APqvOKYBP9IAEq/RTDclTSd1K/PapOzqy98ApbC8
	Lh0UdTH3SbLODq7ALCl6KZeBsDTI8S+ihDe4z7+LqVJu2XTGskB9+h8vBNDPNbmDle82Krk2O9z
	NsmlQq4PkdpOzbnyiFceAiSrOTQiz2aZNrajuBdVCaUdJeNi1BiyBN+Ph8fJjHyEvZ15SMxglC2
	EUsT6txOquHK5a0tmuMiHOMuErLTZpEvOqsQpgMfubVEwjmkzLjO7dGmoeuSQ4rT43PLIp8SjzZ
	YeHf49Mnl8mTPNcVt797
X-Received: by 2002:a05:690e:12c9:b0:651:d0a5:ce2 with SMTP id
 956f58d0204a3-651d0a52b0emr5661070d50.60.1776167511068; Tue, 14 Apr 2026
 04:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412124247.2494971-1-lgs201920130244@gmail.com> <DHRVDETB559R.1J1MUGSZ0VVEX@bootlin.com>
In-Reply-To: <DHRVDETB559R.1J1MUGSZ0VVEX@bootlin.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 14 Apr 2026 19:51:42 +0800
X-Gm-Features: AQROBzCY4aPdRp-vnBolaOekj7WjGOydLpVV0P-0ovLpEH5T-_12fQUc1CoHGng
Message-ID: <CANUHTR-+Dn0uSn8ian_COzX-8=BajnkopK9iUiFNcvurh=CkLg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
 error path
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14143-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: C0C353F9A2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Th=C3=A9o,

Thank you for the review, and sorry for the confusion here.

On Mon, 13 Apr 2026 at 16:04, Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wr=
ote:
>

> Subject is:
>
> > Subject: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
> >          error path
>
> I cannot find a public V1?
> https://lore.kernel.org/lkml/?q=3Ds%3Aeyeq+f%3AGuangshuo

This was my mistake: I did not send a public V1 and sent this directly as V=
2.

> I have a guess this is LLM generated?
> Are you missing the Assisted-by trailer?
> https://docs.kernel.org/process/coding-assistants.html#attribution

This issue was found by a static analysis tool I developed.

That said, the changelog was clearly too brief and did not explain the
actual situation well enough, which likely caused the confusion.

> The patch could be in theory useful.
> In practice however, it's a different story.
>
>  - Comit message says "Since the release callback is only expected to
>    handle cleanup after successful initialization, adev should be freed
>    explicitly in this path".
>
>    Two things are wrong here:
>
>    1. the driver cannot be removed so there is no "release
>       callback" (guessing you mean driver remove?).
>
>    2. this text seems to imply eqc_auxdev_create() makes probe fail,
>       which it doesn't. It only generates a warning and keeps probing.
>
>  - This driver cannot be built as module (will always be probed at boot)
>    and cannot be removed. So the "leak" we are talking about is
>    2 * sizeof(struct auxiliary_device)
>
>    But in no sensible case it can occur. The platforms that use this
>    driver probably cannot boot if our auxiliary drivers aren't present.
>    So if eqc_auxdev_create() fails then the warning is here to be nice
>    but you probably will fail booting afterwards.
>
>    My guess is: you might succeed booting without the reset driver but
>    if you fail the pinctrl one then you won't have a UART. Anyway in no
>    world do you have a sensible EyeQ kernel config that leads to
>    clk-eyeq probing but not its auxdevs.
>
>  - If you fix this then there are other resources cleanup to "fix".
>
>     - ioremap() in eqc_probe()
>     - kzalloc of cells in eqc_probe()
>     - probably others
>
>    But, same as above, "fixing" those will only be useful in kernels
>    that will panic in a few milliseconds.
>
What I intended to express with:

"Since the release callback is only expected to handle cleanup after
successful initialization, adev should be freed explicitly in this
path"

was more specifically this:

eqc_auxdev_release() is the callback that eventually frees adev, but
this path is only reachable after auxiliary_device_init() has
succeeded. For example, when auxiliary_device_add() fails,
auxiliary_device_uninit() can lead to that release path. By contrast,
if auxiliary_device_init() itself fails, the function returns
directly, and adev is not explicitly freed in that path.

So the point I meant to describe was only the missing explicit free in
the auxiliary_device_init() failure path.

Sorry again for the misunderstanding caused by the previous changelog.

Thanks,
Guangshuo

