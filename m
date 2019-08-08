Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0420885C35
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2019 09:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731604AbfHHH6h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 03:58:37 -0400
Received: from forward101p.mail.yandex.net ([77.88.28.101]:41416 "EHLO
        forward101p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731588AbfHHH6h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Aug 2019 03:58:37 -0400
Received: from mxback8o.mail.yandex.net (mxback8o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::22])
        by forward101p.mail.yandex.net (Yandex) with ESMTP id BD91A328182E;
        Thu,  8 Aug 2019 10:50:47 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback8o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id b6NXcWVnh9-okCeTixS;
        Thu, 08 Aug 2019 10:50:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1565250647;
        bh=m7DRG3EEVeBNqEQrEKzyROZROeeP1soo1fwsZFFVh7M=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=YMosURQXYkyLeNWsKBOyWjGd6Zmj7SVcrmBLHKmLwGhyWrE/AtSwgTbwrDMG0F9aX
         wGgLfFeiNukLgYAF9CTjDq22iazEtY9T7HVyk8090XdyfXxCqd+XuFJ0Jt7XUjAJk1
         Sz/2YpiqbGePmmDV7ZDvJbq1iKTjs+qJ9HBObHJM=
Authentication-Results: mxback8o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 03dF3Y2ufp-oegud2Yj;
        Thu, 08 Aug 2019 10:50:45 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com
Subject: Drop boot_mem_map
Date:   Thu,  8 Aug 2019 15:50:06 +0800
Message-Id: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi there:
I was trying to make a generic NUMA implementation for ip27 and loongson-3,
and the boot_mem_map without nid support become a barrier of merging memory
init code.

Rather than add nid support to boot_mem_map, this patchset drops the whole
boot_mem_map as it can be replaced by memblock functions.

--
Jiaxun Yang



