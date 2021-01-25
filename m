Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB49030303C
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732921AbhAYXeC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:34:02 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:57920 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732907AbhAYXdv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617631; x=1643153631;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mPASIDLmjS6/gWOki7jCwozF9YRKuRlJbPJgrKGbESI=;
  b=DMDQiooA0vQmxfl04dLsXcsvIdmbDRckrFwWTjrpqv8JiOkdfxG0NtFA
   C/76JRaeCnsVRPRro+ParNDB1QKXiWoySHVV91cgxlBd++qUiOpbSeXTX
   8N4WpR3LYjEMwJDKGCx23u4pSwVBK2V1Rm7TkKTm1NBKBbfG3YT0Y+GW5
   FBCEpLPQp7PBIKsrl1+L4W72VYz4FCoUzLEPtAomLKLSlJKR9pCpes5ky
   fVVwNouINxk6RP3u11sC7LebNxvS2M4dkeEwf2NkvxxxkG72LT+uTEJTT
   LM5Bs+pGqx1K34uiBmB+PBLqXPThgWG6u1ZpbC80qyneyCe5XiepraxBC
   A==;
IronPort-SDR: gERTxdvqBtQItYn3w2gpBJu6ercePY/UKxYI4nl/bQZEu2jIcbi43wmsHe0alv1d/wokF7Tkd8
 WMcu5PD6t6vkuaf+IStnGP0tR2rVbxPCcuBU0PO2Z3wygbLmIL/p34w/shYuejQlRi4LCbGiDy
 pVwqXhpc7grzTveOuXO4lmfN/iFook6yrzccZJSBz84OEg6al9umLudf9glElRny2zxmf3lDWX
 JdeqMBRZ5GRUIC9Yo/MUqRZgAoyEFcyx4FKe3r6Wkd49y6nvdzvYz+Ue5414jGjuJ89wpEi/BS
 CpE=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="268657365"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:32:45 +0800
IronPort-SDR: aXqmzUPScCimblTTfdnShwrtEJgDKkcUsaUdaOk2UmRjEgJv9OtA1BReUZrq4lnMW6k2Hctv72
 WrGHre5S5QGUj1Zf7OsYNuNie3/B/oPA7jOTYlk5WDlxLYhFBKWPe7coJ14OVMsKWoMxSsAQk1
 PZevWakdE351E2VnhwpKxA2rwdK6ulOOM94Skgme7bCyZZKZRKcyNeQHp53FXV/8GuOBsq2/Wz
 4rvrlXbL3mtxYVLzyGphlSJiuu29gAdzy0ZFJttUWOVBkfzQebeFzeB4moORmpb8re/SOxPaM2
 N+R2ILzCJC0SXZDb9yKrXT4/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:17:12 -0800
IronPort-SDR: VAvgenprhQ+K8hfHLxdAbHdvto9J5RhQcw9vdgL+sUmhPhXEPfPKLCY4374QkI+nrZI/C4+XfU
 SXZhOa699epkurpHpSvHQwDbF2Qcv1KJem4fj+8c5pzI0m/1RSAaKmBDpoJVo1niJ9RpH2qksS
 TOGBG4B2TBwv4c6QrFdHgOgjks932AzZQoA8IkmvigsZmziS102Ejr69HUREE7Prp4Gv19nXj3
 9eQ9+srT3+Ueb3BK6nN0yxW9+lE10WqgxiLrYUdTX2HxU4ixeTdjfOB5WMJKuUEmmtEgJraEvi
 yyg=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:32:45 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 0/9] n64: small cleanups
Date:   Mon, 25 Jan 2021 15:32:34 -0800
Message-Id: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Lauri,

This cleanup series is based on the top of v11 that adds kernel coding
style fixes in the various places without changing the functionality.

Instead of sending a one big patch I've made small patches which are
easier to review, integrate, blame and revert in case of any error.

I've got the reviewed-by tag from the driver owner offline which
is added to the series.

-ck

Chaitanya Kulkarni (9):
  n64: use pr_fmt to avoid duplicate string
  n64: move module info at the end
  n64: move module param at the top
  n64: use enums for reg
  n64: use sector SECTOR_SHIFT instead 512
  n64: remove curly brackets
  n64: cosmetics changes
  n64: cleanup n64cart_probe()
  n64: store dev instance into disk private data

 drivers/block/n64cart.c | 87 ++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 49 deletions(-)

-- 
2.22.1

