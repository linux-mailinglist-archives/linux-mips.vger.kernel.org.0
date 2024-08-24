Return-Path: <linux-mips+bounces-5052-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C495DB5A
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 05:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E34A2B23562
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 03:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFA538DD8;
	Sat, 24 Aug 2024 03:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ibODa9lL"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B5AD5B;
	Sat, 24 Aug 2024 03:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724471904; cv=none; b=mmm9v2LrxPlUCXh8QmSTPi4gOdIkCyYEnQJjWotPlkj8268ATWGWrD2xNUU/4hVWvQ54sy2HuVVqvzMwgc0a1oprPXPYT3VTdiFpmfpz86NVO5NSmRcavolHjhWK25epQOFTbHODNDEPLh1/tJGzySVf0ceM4puIqh27C47OIgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724471904; c=relaxed/simple;
	bh=Clh9AkGSwfDfUvvLJoxosPbut7uF7iTtgQ3zxQUr6Og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rc6vJmSscuYCzYnqqgSMszH9rraTYuBSVm2DVHDOr45qdE2v8Hr/wnXALc8rncza9QwHaOJTrzhx49YuqJb1KWYvRgpQ8vhJ4tZeDPMTY75Q/CF+QlqmUv4dIT2EAscu1KcC3SkDx62axkdamU6JyIf4bT9FooIj6G08e0zjD0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ibODa9lL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Q2nYRi9U4a8itDtDq9LNnEMZ/Twd4vEjX9CTeiWFtZk=; b=ibODa9lL5q7uggEbw2OOQZkuOl
	gdhQY0r9D/9beDb+Bd4qmVTCvwI+QiMjo95/+tPj+4V9U7F5hRFToRdX4k4DvPYHu1OLEHcIx+etT
	KIlSwzlSzvMKbYOerqEj9me07yLSDIeP/0/bbrlY9qqah4ekXhqi/eYjBvvldU6VljO5zLO6djC2Z
	2yksa1axP4sCcbZUGAWwKgEmbBGoAFPkoBoCxdpgqo5+6g1QWpb94Ilm4RmYcg8FZcggX2U6K6Sfe
	cGdem+9zPaemNy7/Cr0ZBWXuCzcsmrGl8tEN+ptWMeKG1q46THZ+VeovOI19ardMWa1DQRk/ZtOsI
	ioZS20vQ==;
Received: from 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhut-00000001ON7-0bmD;
	Sat, 24 Aug 2024 03:58:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: clearly mark DMA_OPS support as an architecture feasture
Date: Sat, 24 Aug 2024 05:57:57 +0200
Message-ID: <20240824035817.1163502-1-hch@lst.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

we've had a long standing problems where drivers try to hook into the
DMA_OPS mechanisms to override them for something that is not DMA, or
to introduce additional dispatching.

Now that we are not using DMA_OPS support for dma-iommu and can build
kernels without DMA_OPS support on many common setups this becomes even
more problematic.

This series renames the option to ARCH_DMA_OPS and adds very explicit
comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
that abuse the mechanism are made to depend on the option instead of
selecting it with a big comment, but I expect this to be fixed rather
sooner than later (I know the ipu6 maintainers are on it based on a
previous discussion).

