Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC30A2A4174
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 11:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgKCKPt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 05:15:49 -0500
Received: from verein.lst.de ([213.95.11.211]:36649 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728095AbgKCKPs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 05:15:48 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id B888C67373; Tue,  3 Nov 2020 11:15:45 +0100 (CET)
Date:   Tue, 3 Nov 2020 11:15:45 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     cernekee@gmail.com, f.fainelli@gmail.com,
        james.quinlan@broadcom.com
Cc:     linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
        bcm-kernel-feedback-list@broadcom.com
Subject: can we switch bmips to the generic dma ranges code
Message-ID: <20201103101545.GA20851@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian and others,

now that the generic DMA ranges code landed, can we switch bmips over
to it instead of duplicating the logic?
