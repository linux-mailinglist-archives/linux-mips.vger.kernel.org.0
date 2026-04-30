Return-Path: <linux-mips+bounces-14395-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEX3Flwh82muxQEAu9opvQ
	(envelope-from <linux-mips+bounces-14395-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 11:31:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACACF49FD9D
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 11:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6086D3012BE8
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 09:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF0C31B830;
	Thu, 30 Apr 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tn4L0IEL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC532F5A36
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541462; cv=none; b=beeHj7n6mmXoUr337L7az/sz0MGs/x6a1Wh7O2xF2GAIEbZX34LqmAMa8mC87nMEu260Qoq4T7QLW3n3P8uKQrnjrGaaeclGB9MKj7iKQoQUUt5No2rEL/IsIp6e0jSgYEmMiYuu91o81LgOHl7H8Dy8oO5eOeB4zzsNA+2C79Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541462; c=relaxed/simple;
	bh=jtnPwyb+L9ig6g3VV84uY+3GHDSFFYIaCwHqIvvfSC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLED7EcQMV3mtlWNgR4a6Xprw/CXsFpLFTrQi35oOJFpeF67xLdutXRIjBlTs4manIOo7qHMwFILC1ae79v/HZw8XkbRa04QotPuitBMwQH608KmeJM1YItSm6YHa5xJADbRM9X6Ws35jhucMBUdCVdTAmSzWqWgNetUPsozO1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tn4L0IEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7393CC2BCC6
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541462;
	bh=jtnPwyb+L9ig6g3VV84uY+3GHDSFFYIaCwHqIvvfSC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tn4L0IELNKS48cGtjdZP84ht4su2kHw2PS+p7pjhH28NFXvhjXbjMP6uK1p9lg44p
	 0+hv7WWe0pPjcE6b1MlVv8gko8nzqVtB4ssa4qt0OycBA2LAPChIpvHqDP7+uxqMBr
	 NRHwcGIzmMEY0CBXorKLL9/eULAAYxtz3WGsNCpTNwEtgK/bU4nMUfUEeCpjTdOA6n
	 16ZAkeqcPpU205reGmPBUMcf3/laJKqZXLbr2DvpWnmIxZRPUqFDz68vPlIgJT+vjP
	 011VLiTg/9wPA1FcjYsElXfi5zobSYfv9GqzvrLhwi4YObYdWaryNIP3G5HFeLaI69
	 tRxIDiFk2lXMQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38df1889fb9so7399991fa.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 02:31:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9PjvvgYJD6kGr52wvErXPJvb3EtQYRmgjqsjvffQdIST6SsPrp+ZHkbTZ6VBdDHZBeo9pj72qseLBR@vger.kernel.org
X-Gm-Message-State: AOJu0YzzhlAZ9rXO8bZzPjgoeaRi3Nk6eoNXIyL8mD3kXehVnRR1aRqW
	oYhQvH5bY9ttsUpm2SAd09ZOAMnCjSzUV2Fy+l5AKQfLcT6eo/DusJs/j7T/i0z9pig3q2EGHdL
	fMikpOH5Jxo6vybsAPgzg2Vb4rJma19iutQp8AVL+yA==
X-Received: by 2002:a05:651c:b06:b0:38e:83bc:1573 with SMTP id
 38308e7fff4ca-3934e2369d1mr7964801fa.24.1777541460959; Thu, 30 Apr 2026
 02:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
In-Reply-To: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 30 Apr 2026 11:30:49 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdRFzSs9Z1BxJVN+zq8DbzRwWPa_E3M+c1LRYQNp=qKFA@mail.gmail.com>
X-Gm-Features: AVHnY4I1zyuyI1uPlLFnkWmIeLPCUgENuUBsy3M-jegNshUiEMqnlBPrQtTt2wY
Message-ID: <CAMRc=MdRFzSs9Z1BxJVN+zq8DbzRwWPa_E3M+c1LRYQNp=qKFA@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: ACACF49FD9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14395-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

On Tue, Mar 10, 2026 at 7:12=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> This series of patches updates board previously converted to use static
> device properties/software nodes to attach and use nodes attached to the
> respective gpiochip devices rather than simply defining unattached
> software nodes with matching name. This is a requirement of newer
> gpiolib code. Note that there is currently a workaround preserving the
> lookup based on the software node name, but it will be removed soon.
>
> The additional 2 patches convert the remaining 2 boards to use software
> nodes as well.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Hi Dmitry!

This missed the last merge window. Do you indent to resend it using
the new swnode field in struct platform_device_info?

Bart

