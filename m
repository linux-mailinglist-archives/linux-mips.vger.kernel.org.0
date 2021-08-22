Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4EB3F3D49
	for <lists+linux-mips@lfdr.de>; Sun, 22 Aug 2021 05:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhHVDhe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Aug 2021 23:37:34 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:7364 "EHLO
        cmccmta1.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbhHVDhe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Aug 2021 23:37:34 -0400
X-Greylist: delayed 548 seconds by postgrey-1.27 at vger.kernel.org; Sat, 21 Aug 2021 23:37:32 EDT
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26121c42b7db-f2047; Sun, 22 Aug 2021 11:27:41 +0800 (CST)
X-RM-TRANSID: 2ee26121c42b7db-f2047
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.22.250.151])
        by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36121c429ec8-65203;
        Sun, 22 Aug 2021 11:27:41 +0800 (CST)
X-RM-TRANSID: 2ee36121c429ec8-65203
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     gregkh@linuxfoundation.org, paul@crapouillou.net,
        jirislaby@kernel.org, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux@prisktech.co.nz
Cc:     linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH 0/3] serial: Use of_device_get_match_data
Date:   Sun, 22 Aug 2021 11:28:03 +0800
Message-Id: <20210822032806.3256-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all:

This patch series replace 'of_match_device' with
'of_device_get_match_data', to make code cleaner and better.

Thanks

Tang Bin (3):
  serial: 8250_ingenic: Use of_device_get_match_data
  serial: tegra: Use of_device_get_match_data
  serial: vt8500: Use of_device_get_match_data

 drivers/tty/serial/8250/8250_ingenic.c | 6 ++----
 drivers/tty/serial/serial-tegra.c      | 6 ++----
 drivers/tty/serial/vt8500_serial.c     | 7 ++-----
 3 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.20.1.windows.1



