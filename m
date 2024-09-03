Return-Path: <linux-mips+bounces-5296-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAAE969952
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 11:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB311C23BCC
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FECD1A0BFD;
	Tue,  3 Sep 2024 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hh5kBEjO"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F41A0BEA
	for <linux-mips@vger.kernel.org>; Tue,  3 Sep 2024 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356390; cv=none; b=MMmHaRpEdnhGztMgDY4P5jEHw52Ha/IqNOYNCZ2ZGqsEgR1gojZaA9WKqYu8HcW4WHcLj0D6wEz0lBYuGtqCoYJltzJllVgbPfOAajwe3yU1py8cNVezH5bsuPp9Lqrd1vnWuAX+B9JhITc66SwOjeJJFo8XBhjOtxI+faiHn7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356390; c=relaxed/simple;
	bh=pE3Mr0PnS9xl+CUiCEH2hxI4fWM92/vwv+iNfIiq4l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRqOHV0GfKxn5cnn7QdC7LRMOVfZWEwC7jY4pFWuxGVxS5mL3Kx/3fvp/X/VuosUtWUsQyiwLhZQ0S/rhXApaXIHXaZLRng769u3bpIfJx4IgNepMKrORWjWPz9wOAFJ7/y/r8LdmvCGs5GCxmewvWckMcBOXK/Xa8rsUA9aeg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hh5kBEjO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
	b=Hh5kBEjOrdKZk3kRJinPc6wdUa5u6DXLTuWECSxYMTKrHHUGqSFrQ2EZzMzn9n3jPjSkDp
	GC6ifzE63Y1thpL3mpxcPpx/fxnMhjD+tQ5mrxZr3Pk0X0fXkFZ29JbgHWf97tb3WJzpaF
	VBc2DqBSZXXc3dJ3AutwG9VxR12KmZ0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-fOi5Z3NjNuaTGLF66xMs2w-1; Tue, 03 Sep 2024 05:39:46 -0400
X-MC-Unique: fOi5Z3NjNuaTGLF66xMs2w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-374c301db60so1478216f8f.2
        for <linux-mips@vger.kernel.org>; Tue, 03 Sep 2024 02:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356385; x=1725961185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
        b=j5XDTltatcsCELDHH8cZwsrGYL6Gs9v/pxiijji/SKGX3HFTuPBjM6zEI5RaX7j0hN
         n38r3LFFSIMMVSrwX01w/5nXmfjMU82wcSL42kX2DBfVOV3YTU16JLdYg/IODgv95M9a
         vspaY7CPH/elyWPNp71BEJ8s7zRnqrBYA/qrdTUgx/pkmsmCWtbwJAxhN8mWz1ERTS1A
         jh2xIfY/Tm6dwU/sVcw7aU8IxmE9Q0zZBYmfMcQ/U4V4y1WuVv58C6wmmOv2221aeDTa
         krJTDZvYhxXCzxEDxBHaiviuZlKjZLoGj1gYdvgRa12ZRgOcQRe6sMgStBy5iWglw8kL
         krxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSsrDAQFrlej9FJOd0sPNq0KLDfQM8MoEnqzB0cgpVwS2uPcsZCFAU7v3wKXoQ5QXIQmTssE0eyIHj@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcDV79CLDRt87xDZnkNGPwjy0UA078bF8wmwyukNxX+Xhz7c+
	kJJvcxyk13VZdx+ebYdye6eCHu1rAGPBnGMNjTT1dgrtRctt41yimP5Uh1VH96f5WK2+zNnSBzC
	iG2U1GuWY3rTLTJu+m570P+u9Tc0U72IEFkwL1V0SVk6yT580XKQy9vepyCQ=
X-Received: by 2002:a05:600c:1f90:b0:429:dc88:7e65 with SMTP id 5b1f17b1804b1-42bb02ecb7emr124596475e9.12.1725356385064;
        Tue, 03 Sep 2024 02:39:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx9ZT+cp/JOzMdJ0eMMwlRMn2QkU5Mi38V0c6sZIqJTMhc/MD50iSbcQF046e0ymvaKlJlng==
X-Received: by 2002:a05:600c:1f90:b0:429:dc88:7e65 with SMTP id 5b1f17b1804b1-42bb02ecb7emr124595995e9.12.1725356384137;
        Tue, 03 Sep 2024 02:39:44 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0f41sm164222235e9.19.2024.09.03.02.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:39:43 -0700 (PDT)
Date: Tue, 3 Sep 2024 05:39:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: Re: clearly mark DMA_OPS support as an architecture feature v2
Message-ID: <20240903053917-mutt-send-email-mst@kernel.org>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240903072744.GA2082@lst.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903072744.GA2082@lst.de>

On Tue, Sep 03, 2024 at 09:27:44AM +0200, Christoph Hellwig wrote:
> I've pulled this into the dma-mapping for-next tree, although I'd
> love to see one of the vdpa maintainers look over patch 1.  I'm
> pretty sure it's correct, but a confirmation would be good.

Missed patch 1, I was wondering why I'm CC'd. Looks good, thanks.


