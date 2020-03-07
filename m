Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A370B17CD16
	for <lists+linux-mips@lfdr.de>; Sat,  7 Mar 2020 10:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgCGJAk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 7 Mar 2020 04:00:40 -0500
Received: from mx2.suse.de ([195.135.220.15]:39616 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgCGJAk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 7 Mar 2020 04:00:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8832EAEC7;
        Sat,  7 Mar 2020 09:00:39 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Correct MIPS patchwork URL
Date:   Sat,  7 Mar 2020 10:00:22 +0100
Message-Id: <20200307090022.6633-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS patchwork lives on patchwork.kernel.org for quite some time.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68eebf3650ac..6fdceffaf69b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11119,7 +11119,7 @@ M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 L:	linux-mips@vger.kernel.org
 W:	http://www.linux-mips.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
-Q:	http://patchwork.linux-mips.org/project/linux-mips/list/
+Q:	https://patchwork.kernel.org/project/linux-mips/list/
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/
 F:	Documentation/mips/
-- 
2.25.0

