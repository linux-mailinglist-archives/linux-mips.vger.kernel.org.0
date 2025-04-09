Return-Path: <linux-mips+bounces-8531-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 592C3A82789
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 16:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79CA13B0F7B
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 14:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68CC3595C;
	Wed,  9 Apr 2025 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YlJwNMx1"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5EB69D2B;
	Wed,  9 Apr 2025 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208238; cv=none; b=UAeRrLilJ8q6GQpDIOCkvGaH1rfopl5dglaq4X8kK9ZTHDiju64du/Tno4eMZ7bmlQ7Rtr41h3HcvXlbyrAW/PKA4EXlt/42XfFWQ7dSZ4E+dkwh5YXoBkDDJ4T8jcVi0RS9eUN4kM4HqxANfy3QTRoYEByQE7aa2s9Kf3ztRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208238; c=relaxed/simple;
	bh=82X3NYXWCJomiHQTWEQfiLI1iuG+CjlNIAJKAsElX88=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VVAzZTN7d8TVTtuH/F8/nRhS0pEl5+P5BoEakvpqFminRKSUonCqtzc+Id+fi4w+wecdtZQDDp9/fAPZDPSlyPgv4TzcjKCdadZEbcmbVXZBBngemnM5KnHeJgi2JDvxVYedirDm8u3OgXjBqGDBeOY5T4VB25fHRcn+IK5NcwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YlJwNMx1; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744208232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=82X3NYXWCJomiHQTWEQfiLI1iuG+CjlNIAJKAsElX88=;
	b=YlJwNMx1NJN9JLAeoFjz0r/bVqyyi12GXh2fREXtt5m9JxY2/et93hkZk6HuByQZeH0KDa
	yIDnhLxZ1o9u9ZsZv21W6DXlt//UzFB2G7rOb5HADlzOSi7WiWFCAVX+klVEUQsfNEEbvC
	GVt0VWlSVAPj7zVyYg5zxfK1zMZD80s=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH] MIPS: ralink: Fix refcount leak in ill_acc_of_setup()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CAOiHx==cJicn3fYbf+yOfGX1ORZNgBwUNuV-2CNAxmdpn9O5Ww@mail.gmail.com>
Date: Wed, 9 Apr 2025 16:16:59 +0200
Cc: John Crispin <john@phrozen.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 stable@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <83B958C5-1C7B-43C4-9EA2-93F8705B31A8@linux.dev>
References: <20250407082759.742105-1-thorsten.blum@linux.dev>
 <CAOiHx==cJicn3fYbf+yOfGX1ORZNgBwUNuV-2CNAxmdpn9O5Ww@mail.gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
X-Migadu-Flow: FLOW_OUT

On 9. Apr 2025, at 14:57, Jonas Gorski wrote:
> On Mon, Apr 7, 2025 at 10:32=E2=80=AFAM Thorsten Blum wrote:
>>=20
>> The of_find_device_by_node() function increments the reference count =
of
>> the embedded device, which should be released with put_device() when =
it
>> is no longer needed.
>>=20
>> In ill_acc_of_setup(), put_device() is only called on error paths, =
but
>> not on the success path. Fix this by calling put_device() before
>> returning successfully.
>=20
> I would think this is very much deliberate as the device is used as
> the priv argument of the registered IRQ handler. AFAIU as long as that
> one is live the reference of the device needs to be kept.
>=20
> Dropping the reference of the device should only be done after
> freeing/unregistering the IRQ again, which currently never happens.

Thanks for the explanation. I assumed request_irq() would increment the
refcount, but that's apparently not the case because it's just a cookie.

Thanks,
Thorsten


