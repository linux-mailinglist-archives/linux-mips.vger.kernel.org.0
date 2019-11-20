Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99E9D103803
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2019 11:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfKTKz0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Nov 2019 05:55:26 -0500
Received: from verein.lst.de ([213.95.11.211]:39487 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727230AbfKTKz0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Nov 2019 05:55:26 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9F59C68AFE; Wed, 20 Nov 2019 11:55:21 +0100 (CET)
Date:   Wed, 20 Nov 2019 11:55:21 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
        mgalka@collabora.com, Christoph Hellwig <hch@lst.de>,
        broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com,
        enric.balletbo@collabora.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Burton <paulburton@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Hogan <jhogan@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Paul Mackerras <paulus@samba.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linuxppc-dev@lists.ozlabs.org,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: next/master bisection: boot on peach-pi
Message-ID: <20191120105521.GA3958@lst.de>
References: <5dd42b85.1c69fb81.36825.244a@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd42b85.1c69fb81.36825.244a@mx.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thanks.

Marek Szyprowski already reported the issue and a fix is in the works.
