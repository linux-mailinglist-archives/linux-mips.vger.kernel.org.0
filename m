Return-Path: <linux-mips+bounces-5145-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C0961F1B
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 08:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC6028477C
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 06:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564501553B3;
	Wed, 28 Aug 2024 06:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DachNt1c"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B89154BEB;
	Wed, 28 Aug 2024 06:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724825474; cv=none; b=OOh3lQ2G88eN+xYQgj8HCLJVEWmz3zoVOFscsRvQ94i4dd48I2YpDiFf6jB4ZAhOpxYbr8qAaO+h8Tqd7+S+ThgDJ40obkJDQOs3eJlHTrhIzVU6HftMf6OTklerlu27O53oqpb5FKRgC5VbBBNDELlt/V8eDQjeu5LiDo4NS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724825474; c=relaxed/simple;
	bh=V6pyX/V9WzOPOgZXoGWZlDs9X15kC2OZmru0k2I4WI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k75l84nfPaum7HSTQ9imQWt2O+Y3Xm/uv5JxxArJpLBHEQNgBuj+uR5OPpC6r3dwkyS4veIADSh/UlJwpauZVrwJN3MrlgKBzNWCgltj0sp60XXkNwFyQpKz1sX6JQF+nx9RO1AGKhD/E3HfToS9NEhGxHRaMj7sIJ9aBgfrPu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DachNt1c; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3ciW+jDJYrdLJiK7yrXhNzVEL4ig56HUYUk4VOvh/z0=; b=DachNt1cx+ujVHKXHJfhguYPcC
	9aAqfBoRuTD2BycDnkoq2+XVJgduR0jUZafb+wHb4B+tRHNCEo+SGOrtcsQvZMydA7tNGInWBQs5w
	69FOaQMwVwWuo6pPJtsi2BcUec+73lr/fSkNmYLKWVNWI7lSQZKrpLFPAp9IcRtasZAYiQf8cOkxO
	tni42Ic2e8NqYRy7ZadXs2xugccm0Zfp5fifHQ9pwwtZOGq968HzDTabeQWV+VtZubJN2NukZ+srM
	m7lxrEC4huwPqB6G7d3uGQA+7nAvrJsZgB3gE8FZFou6JBOpJJHKhnTlWsvD8OBG21HfoKRWJ0AQk
	brwIO41g==;
Received: from [2001:4bb8:2dc:a2cd:2ccf:8fbe:8ab4:c9db] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBtc-0000000E1uI-0svg;
	Wed, 28 Aug 2024 06:11:08 +0000
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
Subject: clearly mark DMA_OPS support as an architecture feature v2
Date: Wed, 28 Aug 2024 09:10:27 +0300
Message-ID: <20240828061104.1925127-1-hch@lst.de>
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

This series renames the option to ARCH_HAS_DMA_OPS and adds very explicit
comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
that abuse the mechanism are made to depend on the option instead of
selecting it with a big comment, but I expect this to be fixed rather
sooner than later (I know the ipu6 maintainers are on it based on a
previous discussion).

Changes since v1:
 - s/ARCH_DMA_OPS/ARCH_HAS_DMA_OPS/g
 - spelling fixes
 - vdpa_sim actually doesn't need dma ops these days, add a prep patch
   to remove the dependency

