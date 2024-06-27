Return-Path: <linux-mips+bounces-3990-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDF891A96A
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 16:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E7621C20C33
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 14:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5825197A60;
	Thu, 27 Jun 2024 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xo04DL3U"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FFC197555;
	Thu, 27 Jun 2024 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499354; cv=none; b=Ybpdd4ueb2mUJO7mI/6m9EURUi2TCfEJkALNfzZYoTyWcQs+RgSHpwv5vIm3u7OzW95zgao4RyJQ/vGbWDATyhlkMg72U6iUA+OsRpExLRd/oYnV/rKpzVp9PsVISnvULkI+3JRJsC7299STRl7eQ4CowfqgZs+El0804z0ffXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499354; c=relaxed/simple;
	bh=2epyvIMgz/umKD0zxRhjVW1mRZUXIsUBKKbBDmo4di4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2f/6c9qZATQG3bvbq17LtEkKLHbTWygybSkdjq79hca233WFyN7586bjgjmTDfZOH2kH6rVgNmmjoXGlcgZSpP2RW8Uzd5zn9LOdjAPg/ktsJQ8iLDrh3lxPrx2ejJzZUfA0pxJGYbuepcxbAVP6N1byBM/6JZZ8Vj7YGZDEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xo04DL3U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CF1C4AF13;
	Thu, 27 Jun 2024 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719499354;
	bh=2epyvIMgz/umKD0zxRhjVW1mRZUXIsUBKKbBDmo4di4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xo04DL3UVemmECpwY64ES8e42gsvrt9q4M3TVRlXctyDXkQRl1pXP67dc/kQUHOBb
	 Jwr1LgPcXns8f5ArGCbsj28zJRtGafIWgOw88bHuU95a31msvn0jkcL6Gi5h0+7gwL
	 HTqKinNGs1+Rgk4ORxnyNf6umn9Ay5vuosGPBiAKq3gtQG1CnDLF+UJrjqNy18R0WY
	 2r7MfMkXWZhxjYEmbSlOWUIt2Cd5erMnGe3UEF9V97V4UQIKV3ZiDh8hVxe1mb+rhZ
	 0vs5i/Nh219zLYpfJW+W5MFigo3pfrpYf+/OQNtv7eOjjJ+itLEDgolYA7sNzSG+Tj
	 kbBrgYiXLU6Dw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e72224c395so92478741fa.3;
        Thu, 27 Jun 2024 07:42:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0xXKtAEupCoCEM2ydWc+p4Eo2vMPiohfQafS6EtEhZAn6TOnZsvYaK3C9T9qhP8dVmqXL5LGY76Y267e0qajZf1dk1OB9tT9PQzSLlvChlYv5rRfqGOYOyfNPl7yLU4ThrhkEUpZu/D+Gh5sdPn/3lxooDaffeSEm0zzopa9BTFF8OVg=
X-Gm-Message-State: AOJu0Yys/jqusM24/3stzE7XMCoZEAXTbR/9Hj2/5/nyz0vj65FclpcU
	mXmzaQ2+Cb40UbmFvV82KhZqBA9j57HBXpDje7cg6qS+pmxwbIJm61VM3kXZ1MRT1mp8TZz7mV7
	UO2E8NLbvVB1GW3wXGUUSjjc69Q==
X-Google-Smtp-Source: AGHT+IGdl09ud227mx6eWzKbhuN9jD43lHc173QiIvTh5p9OBHVav1TbmbgaqVowBm1lPdgNDMA0Q9EBVBXaFgPM5nE=
X-Received: by 2002:ac2:47e8:0:b0:52c:d905:9645 with SMTP id
 2adb3069b0e04-52ce183293cmr8939536e87.13.1719499352719; Thu, 27 Jun 2024
 07:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Jun 2024 08:42:20 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+1M47kRb5xELSqroPLbava4TJkiLjDT8er0=iiBmutfw@mail.gmail.com>
Message-ID: <CAL_Jsq+1M47kRb5xELSqroPLbava4TJkiLjDT8er0=iiBmutfw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] mips: Support for RTL9302C
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	tsbogend@alpha.franken.de, daniel.lezcano@linaro.org, paulburton@kernel.org, 
	peterz@infradead.org, mail@birger-koblitz.de, bert@biot.com, john@phrozen.org, 
	sander@svanheule.net, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org, kabel@kernel.org, 
	ericwouds@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 10:33=E2=80=AFPM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> This series adds basic support for the RTL9302C reference board. Currentl=
y the
> focus is on the CPU block stuff. I hope to get around to the DSA switch d=
river
> eventually but this is a small start that lets me boot a mainline kernel =
on the
> board I have. I initialiy started with code from openwrt but have paired =
it
> down to just the clocksource driver and devicetree.

Your emails are being sent as quoted-printable encoding which is
generally preferred to be avoided on maillists (as is base64).
git-send-email should normally use 8-bit encoding, but the man page
indicates QP may be used if there are carriage returns (there
shouldn't be).

Rob

