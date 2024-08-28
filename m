Return-Path: <linux-mips+bounces-5146-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 662BC961F29
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 08:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8665B21638
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 06:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BD9156C78;
	Wed, 28 Aug 2024 06:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G6ceizxa"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43111552FA;
	Wed, 28 Aug 2024 06:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724825476; cv=none; b=D37BnZGKBo+RdM0aiqvdYEGFcNOW3O2BmOrZCXTUA+zpGPo/UNdchirVuxpNLRSyRmhraFanGfuZeK65/zLLdMDA2zEgUiXCX6aIc14iFTDow0p7ZdkJ2eSbuGPC2H46nmxNhxOg5QVAUnh/MFZ3/FccVgDL3Q83l2vP7xROTD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724825476; c=relaxed/simple;
	bh=Y0HsE+O4qpOirqGA3+fEen483vhSvhiow81p85kx0vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nriduswEhV4ulFJEUgoeCq6tOD1YYxgbh/lk1GpnukQnhsmDK/GcCseP+zr4QHgO8sHNkhocH4Qih1qxAeMrvrjvoQcRCUGL9WtZb/mqa9zoSoazvIkBYE9kyIFPlXLovHuHJlaA3bs1x/fKZdlRXnByZ1Yhp5S8PB04B/rywBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=G6ceizxa; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=xXPvEjkN13oRSPiD1VpIsI6lICkEOhwDSVN6M4ebF3M=; b=G6ceizxaxo/5YPTjysre3RE3P5
	r6theemKFI6tHVBOtljvn4KkqxAS2QAOgq2kFNqL/qSweoZ78GG5roeidLnOxQYaFwBGFSvMgjIxT
	Nd3VjlhZeAlYoMTPJ/A+LgEVZKiJo8/6vpC94GKnxo/yeszqxNmOI2uH+gYkKm6wByymb+IQbHgRs
	lDgiPm0CITsg8ivicn6DOIMDexltTWRjLyX7eFt13Mh7KXkquOY+RUG+jycl2hgcaS99zex+kd+o9
	eIbY6ta0tPyXUDbcb5Au2QNiyOxW5yX9stCLkEzWH5+UibAoch+LaUcS6z8gLwS5pfwAXC+wswjoI
	AbBwVQ3w==;
Received: from [2001:4bb8:2dc:a2cd:2ccf:8fbe:8ab4:c9db] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBtg-0000000E1uh-0axG;
	Wed, 28 Aug 2024 06:11:13 +0000
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
Subject: [PATCH 1/2] vdpa_sim: don't select DMA_OPS
Date: Wed, 28 Aug 2024 09:10:28 +0300
Message-ID: <20240828061104.1925127-2-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828061104.1925127-1-hch@lst.de>
References: <20240828061104.1925127-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

vdpa_sim has been fixed to not override the dma_map_ops in commit
6c3d329e6486 ("vdpa_sim: get rid of DMA ops"), so don't select the
symbol and don't depend on HAS_DMA.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vdpa/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 5265d09fc1c409..b08de3b7706109 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -11,8 +11,7 @@ if VDPA
 
 config VDPA_SIM
 	tristate "vDPA device simulator core"
-	depends on RUNTIME_TESTING_MENU && HAS_DMA
-	select DMA_OPS
+	depends on RUNTIME_TESTING_MENU
 	select VHOST_RING
 	select IOMMU_IOVA
 	help
-- 
2.43.0


