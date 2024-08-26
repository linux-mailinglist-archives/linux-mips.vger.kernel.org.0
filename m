Return-Path: <linux-mips+bounces-5085-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56F95E901
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 08:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 753B11F215DC
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 06:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0D913A256;
	Mon, 26 Aug 2024 06:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ObQY/mH9"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D713777F
	for <linux-mips@vger.kernel.org>; Mon, 26 Aug 2024 06:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724653956; cv=none; b=jZHPJTaoY3QcoEmOOh2mSvUgfaqWlPfEBL13Wum5MlZLK1f/VkNcRSiTZICYEWNbm6rMKaRiICjkkQgxsUnhXX5mqXfKk+xPxiiLi7NKDDn+GerrD9DI1VLa71tmalTHQPxlhf30GQ8M6jEkxKluNwgxtU9XJm9mKmV69gLvJWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724653956; c=relaxed/simple;
	bh=JESifInmWvZeQwWI8Jn8J0cYeIeDZ3prAXhvDlTsSj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lk3GgVw2zZ9srvJmFI6lj6dlXfUwJX3MoSvEqsR6ec2jDiwSoCRassVqUfbSjRgzmx1qG7iYe7rBktdoV2+b/S7a/IfzIJkaHediqF/RQYct+kGI5NQXY/nEg4OSH8KtOyLfRHbJmHFz2UF10J2yy6FYPFb+zsQnCYiywvP5O0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ObQY/mH9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JESifInmWvZeQwWI8Jn8J0cYeIeDZ3prAXhvDlTsSj8=;
	b=ObQY/mH9voyymi5S9Rw1pLU/ngEAYvlWxECldEI7tp4ctKZyp7h+RUnX11EOwqU1iZxSps
	9LIOc60DFRtcngSyIbGTsqRJJOW1QlIyk1TBuhvr2FUDFyDRhIAgkU7IVxpGzIIXyN+S73
	evYGjHwuUoWe/ttTzmRyi4RqAGBRqY0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-gpUI0rMdN8aytG2jdEOubg-1; Mon, 26 Aug 2024 02:32:31 -0400
X-MC-Unique: gpUI0rMdN8aytG2jdEOubg-1
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-498cd41e002so1479025137.1
        for <linux-mips@vger.kernel.org>; Sun, 25 Aug 2024 23:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653951; x=1725258751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JESifInmWvZeQwWI8Jn8J0cYeIeDZ3prAXhvDlTsSj8=;
        b=kDNLauPEkvEK5suX4fWwRwRYF0hwx53ktFqad8f/aZ+Q2yj2+wWJYAlSy2mu3vw1Zg
         b9XkqObWz1KBzX93Xm7hZv95zYspj/eqGBnjn4Hk0Cj+JMEIr+2nR0GSMzS29XboJ/p7
         N2NbBiSMQU12rXetwI9SMv+6/isPVvqF5GkcSjiHJRHlojgNB4qpsGEIqnMW+b/5+QWJ
         CghtE5iSpziNt9TgpYFWdb0G5dBFM87cR7ZigDNA8MO9t1+63uNNJQ2XEGnfmHQ4kPAw
         8E4BuxRrHHyWjpHU7y5cE0D4U5K4tID6ZaE78lvizE05cgkgwkLTZbHMBWBIiq7UvniQ
         69/w==
X-Forwarded-Encrypted: i=1; AJvYcCUvTuvcix6gTrhlrnKxwYLR/0Wu8ySKh8z8LOZ1PEx2gldAjjpyYyuPDgp8aeDc98l3whDwBCKDUP9K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2gvQVkIv2K+hPWQX+m2PN9fOW3fcoVZTKN1YdAYGI4q50fLBN
	YOMHZ4p/ZJmOPFaT5aqWYDx3kKcPcFo5sAyLr6cge9c6cL5tCSYdA9++W1GKxfMfHH/cKUguKD7
	DehnXyomnbZLTa2mgmENd//2M3AlzoX0r4TQyCJDboNHghPovPjU4E00+I2x05fhVvOXD/vLpJm
	CilpNv1cNnUC+f72p0EnJ+pZrYrTLW2cclVg==
X-Received: by 2002:a05:6102:3f0f:b0:498:cca9:8b3 with SMTP id ada2fe7eead31-498f4768d98mr6498553137.31.1724653950686;
        Sun, 25 Aug 2024 23:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwydcuFOVlgtFmwjWlxiF2u2xtiMO6UvY+/x7l/PEgUFs/udwBSaHF5gxdau0K58G8iWDDv631otNdoDoL8Rg=
X-Received: by 2002:a05:6102:3f0f:b0:498:cca9:8b3 with SMTP id
 ada2fe7eead31-498f4768d98mr6498530137.31.1724653950260; Sun, 25 Aug 2024
 23:32:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824035817.1163502-1-hch@lst.de> <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
 <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com> <20240826063002.GA30266@lst.de>
In-Reply-To: <20240826063002.GA30266@lst.de>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Aug 2024 14:32:15 +0800
Message-ID: <CACGkMEvB20-iwNKepBdJBNAvxN-5+MduxnX6XDbPFsVA4hNz5A@mail.gmail.com>
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
To: Christoph Hellwig <hch@lst.de>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, iommu@lists.linux.dev, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-media@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 2:30=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Mon, Aug 26, 2024 at 02:27:27PM +0800, Jason Wang wrote:
> > Actually I meant, we can extend the virtio_config_ops to allow mapping
> > ops there, then simulator and VDUSE can hook the map ops there.
>
> From a quick glance that feels like the right layer of abstraction,
> although the config part of the name feels wrong at that point.

Right, or we could have a dedicated map_ops instead of trying to use
virtio_config_ops.

Thanks

>


