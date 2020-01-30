Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7161E14D88B
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2020 11:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgA3KCk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jan 2020 05:02:40 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:52624 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgA3KCk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jan 2020 05:02:40 -0500
Received: from localhost (unknown [IPv6:2001:982:756:1:57a7:3bfd:5e85:defb])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4CF9E15AB0D16;
        Thu, 30 Jan 2020 02:02:38 -0800 (PST)
Date:   Thu, 30 Jan 2020 11:02:36 +0100 (CET)
Message-Id: <20200130.110236.635220430261346308.davem@davemloft.net>
To:     b.zolnierkie@samsung.com
Cc:     ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        corbet@lwn.net, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ide: remove no longer used au1xxx-ide driver
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200116122938.20789-2-b.zolnierkie@samsung.com>
References: <20200116122938.20789-1-b.zolnierkie@samsung.com>
        <CGME20200116122951eucas1p27bed87e1d46b5e1d8fc91abc33cd013a@eucas1p2.samsung.com>
        <20200116122938.20789-2-b.zolnierkie@samsung.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 30 Jan 2020 02:02:40 -0800 (PST)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Thu, 16 Jan 2020 13:29:36 +0100

> Commit 54ff4a1d1732 ("MIPS: Alchemy: pata_platform for DB1200")
> from year 2014 converted the only user of au1xxx-ide IDE host
> driver (MIPS Alchemy DB1200 platform) to use pata_platform
> libata host driver instead. This patch removes dead au1xxx-ide
> driver code.
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Acked-by: David S. Miller <davem@davemloft.net>
