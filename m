Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0CE61B60E
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2019 14:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfEMMcu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 May 2019 08:32:50 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40670 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbfEMMcu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 May 2019 08:32:50 -0400
Received: by mail-lf1-f67.google.com with SMTP id h13so8904621lfc.7
        for <linux-mips@vger.kernel.org>; Mon, 13 May 2019 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fungible-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=AmlKlpgG0+NNPzSQcKNjK8PPhmzjdjJSbpUapeNlyTI=;
        b=1GAlkQwKapnpb365Mx40DxHyp3osgP2obBOGRiNcVzJGRz4bZYhdkeoyspiVS15y7H
         grPpVTbMf110+G8HNEN8yj62vAwaKfeMQbtQ/tu0e0Rx8/DUxr/4V+fQrrvP13rKje5f
         3Ir/gG8e4kLA+V8QPxeYQt0P/ITZ4H2ySXovElyMUZet3BqaNrN6WTkzMR5N3zRMI9UO
         bacrrL9cmGJNmWNqBKpvoWS8Q10iMj7ur6suDhkycOTfaeB2vZU0N9NnLFFgav+PF8WZ
         f0QGqPm/nZ7XlHXLh7kg4NTTtWt+7gIliXiSjihC2yJVS6FS5/iH+/89XLrCw42F5/h5
         Ndqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AmlKlpgG0+NNPzSQcKNjK8PPhmzjdjJSbpUapeNlyTI=;
        b=gD9/NIPmJo3WsEGlndZ55PJKAsxqBRB/hLzeRELQdKNbE+CwOc40+WCnLMHMgXMFQB
         ay7C4q/HrvgaLgWqWmgDYk3rZfFSvOUadiF/WT+LPnDMr/0hm5o9SQq9pJyizxS0pOQ+
         1IS5hqz6QfaB8xBSYiXB1o7xe79jLuRgGQpX7+uanVv7O4e97ow+StLUX5u1+q+iMsj5
         tKOOPaBEc0ZZ7jNDQ0qydsFu5iUoq6E4iyyhK3eYqB6dUv+iMcAmc9M4LHJDB+xvKr6W
         6fGyojJdk6itUip5xF7DRW0UCt7GEKGEQcLTSYRGpUzn57/TIvplEqfZzCYPqafai+Pr
         8lyQ==
X-Gm-Message-State: APjAAAWDa8dpF5q8lVZURLLtGmW+zBjF8n198h1iey2mPn9YRMNPjCd3
        XA1ni3h6k383aLkXnqn6Hu6SXmn0yHA=
X-Google-Smtp-Source: APXvYqzWTuJRCWcvyM854Gpfvqy1irJCjnloDYl8z+uJ+DHMMifWlAKuYdb2YdgA5jIdX/8CKWkNhw==
X-Received: by 2002:ac2:494b:: with SMTP id o11mr13523940lfi.9.1557750768472;
        Mon, 13 May 2019 05:32:48 -0700 (PDT)
Received: from WR-NOWAKOWSKI.fungible.local (dynamic-78-8-11-53.ssp.dialog.net.pl. [78.8.11.53])
        by smtp.gmail.com with ESMTPSA id h15sm2811134lfc.21.2019.05.13.05.32.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:32:47 -0700 (PDT)
From:   Marcin Nowakowski <marcin.nowakowski@fungible.com>
To:     paul.burton@mips.com
Cc:     marcin.nowakowski@fungible.com, linux-mips@vger.kernel.org
Subject: [PATCH] [MIPS] generic: fix appended dtb support
Date:   Mon, 13 May 2019 14:32:43 +0200
Message-Id: <20190513123243.9515-1-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Appended DTB support is mostly intended to be used on legacy systems,
but it is a valid feature that can be enabled for generic platform,
which currently doesn't support it - if selected, the appended DTB will
be ignored by the platform startup code.

During kernel startup, the appended DTB's location is stored in
fw_passed_dtb if the init code finds what appears to be a valid DTB.
Otherwise (if a0 == -2), a1 is stored in fw_passed_dtb, so either way it
will always point to either a user-pased DTB or built-in DTB.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
---
 arch/mips/generic/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index a106f8113842..a84475f1924f 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -43,14 +43,14 @@ void __init *plat_get_fdt(void)
 		/* Already set up */
 		return (void *)fdt;
 
-	if ((fw_arg0 == -2) && !fdt_check_header((void *)fw_arg1)) {
+	if ((fw_arg0 == -2) && !fdt_check_header((void *)fw_passed_dtb)) {
 		/*
 		 * We booted using the UHI boot protocol, so we have been
 		 * provided with the appropriate device tree for the board.
 		 * Make use of it & search for any machine struct based upon
 		 * the root compatible string.
 		 */
-		fdt = (void *)fw_arg1;
+		fdt = (void *)fw_passed_dtb;
 
 		for_each_mips_machine(check_mach) {
 			match = mips_machine_is_compatible(check_mach, fdt);
-- 
2.17.1

