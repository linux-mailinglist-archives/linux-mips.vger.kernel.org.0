Return-Path: <linux-mips+bounces-5083-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F14CB95E8DE
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 08:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30BDC1C219D7
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 06:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717C913B588;
	Mon, 26 Aug 2024 06:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UsdQ93ON"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2013AA2B
	for <linux-mips@vger.kernel.org>; Mon, 26 Aug 2024 06:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724653665; cv=none; b=nq7O/1dQMKpcslTNDFhd6jjEYUGJxR+2eL6DKIaR7KC6XFOAua/6QE31gpBGbL92/YLEeVStS5zQca55SaRCvQY2G4SADEZfadjDwbQH+WmBkex0tR0aKtYen73CSAW9KEaJIlNxX7FL+fSE0MAZbAlhHp6eKCtfxsF/GPFyYxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724653665; c=relaxed/simple;
	bh=9FdJ3ALSTNHxptv1eM+dVepm0TpConKuAyxPlsMtLjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9kYyqdOagnhoUBq8CtPcDfIqjn3CkMzWmrU0Hmnu1S0O0syRkvI4Ja8deiFY8s3+bkAjj1/loKeDgqenuxSr4gFvrwYX3d/7MoqPNKMqUgk7f5vd7qN7oGpM0aCvL/LggUhTB/rPILN0TppU5JW0p4Xj88TAaHCgrF9N08Tuq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UsdQ93ON; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
	b=UsdQ93ON3VLcEl6ay87yKZheFJX2fLWFSltLAH3M9fxYyug1urqq7ApX4gAbsofWe52dl+
	o4lX7MGIFIkVkcqehLsGNahHAnT97pFsSdnU4bMmrklatEk4Iqp1PWTqMir9lJxlC355B6
	QPmsLJFJwKUwGM2uPVW2ionjm9SjNCE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-fbWMyVtRNU2-jHJTyR32dQ-1; Mon, 26 Aug 2024 02:27:41 -0400
X-MC-Unique: fbWMyVtRNU2-jHJTyR32dQ-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2cb5847ff53so4911385a91.2
        for <linux-mips@vger.kernel.org>; Sun, 25 Aug 2024 23:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653660; x=1725258460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
        b=amfwhMr3yeOLczI22Te3clRWBWxqbIPYSsOWQjVmJ1YetRZH/a1voJjNYfZkQwgAOk
         0cCC5e8YOGe1wNv6XaU8luko0rGPIpfXCM65tQF0AnnSkddw4DZCo6844pdKdvi3SJKT
         kqxPkb8KFpriyhuS6QbO552jMH3HIcDCQEntof8K2gzOYdEtrAVAg88RX/iILvx1VG9n
         tkoJXIaOL1NmC0TsOlU/9bBykDdmAZlrg8psiBoFDMdM068qksc4xUaXf8A/3936Bq5f
         CtsD5lJHzb4RTZ9cljgKNlJiQVw1WEb5fIw/Pssj0qLV45RoUSI8vD3r3YSoGodhyHNX
         kNww==
X-Forwarded-Encrypted: i=1; AJvYcCXd22FU8XPCR4h1nH20uBynJXHG//bVuCpRdpKlacDAGVlguksK6NsQa6zV2WT0BuqZ/t9TdtEdWdq4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8hPaHNbqU77SCEjsJMbO6mi3JWw0ODzucuMijy4qmLuIX2aBV
	DcpWIwBk0B3HgxGCX5p5VA7ZyzyvIbEeCgihZH5/aDYUZm6pxSlRoYdcPruRfTpWS+TFhxDn8br
	2jrRPapli+B3qfBW2V4sZWHLiUzQ/tz3DroV6qLMjMEofntzjzKyY+siyPsFUS53IN1Q2FTg/vM
	r/KJg5i84iGXLMslSrq51B3LO63RXjEV4QD7NNh2FuYA==
X-Received: by 2002:a17:90b:ecd:b0:2cd:619:6826 with SMTP id 98e67ed59e1d1-2d646d4dcfbmr11272919a91.34.1724653659610;
        Sun, 25 Aug 2024 23:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP3GZqzlMhqPuuYHeWu96SGn+Tu3LWd1hDEbxpGhfc1OXWvtkUWRElPm7DPTwJzR3LmdWyUKTz2DeMu9Do6/Q=
X-Received: by 2002:a17:90b:ecd:b0:2cd:619:6826 with SMTP id
 98e67ed59e1d1-2d646d4dcfbmr11272892a91.34.1724653659123; Sun, 25 Aug 2024
 23:27:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824035817.1163502-1-hch@lst.de> <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
In-Reply-To: <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Aug 2024 14:27:27 +0800
Message-ID: <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
To: Christoph Hellwig <hch@lst.de>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 2:16=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Sat, Aug 24, 2024 at 11:58=E2=80=AFAM Christoph Hellwig <hch@lst.de> w=
rote:
> >
> > Hi all,
> >
> > we've had a long standing problems where drivers try to hook into the
> > DMA_OPS mechanisms to override them for something that is not DMA, or
> > to introduce additional dispatching.
> >
> > Now that we are not using DMA_OPS support for dma-iommu and can build
> > kernels without DMA_OPS support on many common setups this becomes even
> > more problematic.
> >
> > This series renames the option to ARCH_DMA_OPS and adds very explicit
> > comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
> > that abuse the mechanism are made to depend on the option instead of
> > selecting it with a big comment, but I expect this to be fixed rather
> > sooner than later (I know the ipu6 maintainers are on it based on a
> > previous discussion).
> >
>
> I will try to fix the simulator considering virtio has already had
> mapping ops now.

Actually I meant, we can extend the virtio_config_ops to allow mapping
ops there, then simulator and VDUSE can hook the map ops there.

Not sure if Michael is fine with this.

Thanks

>
> Thanks


