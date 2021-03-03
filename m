Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F41332BD97
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345699AbhCCQRM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:17:12 -0500
Received: from verein.lst.de ([213.95.11.211]:35522 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356477AbhCCH2C (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 02:28:02 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id B7D4D68B02; Wed,  3 Mar 2021 08:27:08 +0100 (CET)
Date:   Wed, 3 Mar 2021 08:27:08 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     linux-ide@vger.kernel.org, linux-mips@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Toshiba TC86C001 support
Message-ID: <20210303072708.GA8575@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

a lot of te mips defconfig enable CONFIG_BLK_DEV_TC86C001, which is
a legacy ide driver that has no libata equivalent.  We plan to
phase out the legacy ide driver this year, so I'm wondering if this
hardware is still in use by anyone, and if yes how we can get a libata
driver for it?
