Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C07D113DA03
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 13:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgAPM3y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 07:29:54 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38079 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgAPM3x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 07:29:53 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200116122951euoutp0214cf1aead6a8f7249559b7db14de9508~qXdW39HfR0644306443euoutp02W
        for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2020 12:29:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200116122951euoutp0214cf1aead6a8f7249559b7db14de9508~qXdW39HfR0644306443euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1579177791;
        bh=9smxSwk2JX5E045fPogk/LSOgeGj4lDoUVspfYuU4Do=;
        h=From:To:Cc:Subject:Date:References:From;
        b=YckGHTbVL3T7wB1KdbCl4YZU9uniSHNyenKBea0AsCvjA0O2WQndPWEr/QQ3CK/l4
         iVWAEbZRV8CqCsNdiRXXRuAffP/Kjk1TLIHSkqs+KcbZjtugcQ12PVWwquFgjJn6nX
         ZUhRvyJ+GwquixbiCOafq3eCA2kYsz1soMlOsnMA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200116122951eucas1p1a80018be5cd8fc18e358f6a72b71ce62~qXdWghTn71717617176eucas1p1V;
        Thu, 16 Jan 2020 12:29:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id DC.2F.60698.F37502E5; Thu, 16
        Jan 2020 12:29:51 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200116122951eucas1p1d36493f2b496bb13dca4fd1a17abad49~qXdWMkQMn1718617186eucas1p1c;
        Thu, 16 Jan 2020 12:29:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200116122951eusmtrp22589902b42e5cdb84cbbe6668e393695~qXdWL78CO1149911499eusmtrp2E;
        Thu, 16 Jan 2020 12:29:51 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-d8-5e20573fb24e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E2.32.08375.F37502E5; Thu, 16
        Jan 2020 12:29:51 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200116122950eusmtip1fe10a41302d87854f36386f1033f69ec~qXdVjUpIb0460004600eusmtip1b;
        Thu, 16 Jan 2020 12:29:50 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-ide@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com
Subject: [PATCH 0/3] ide/MIPS/docs: remove no longer used au1xxx-ide driver
Date:   Thu, 16 Jan 2020 13:29:35 +0100
Message-Id: <20200116122938.20789-1-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87r24QpxBjfnSFhsnLGe1eLJgXZG
        iznnW1gsJp74xGKxsG0Ji8WxHY+YLC7vmsNm0blpK6NF3+tjzBaX9qg4cHlsWXmTyWPTqk42
        j6Mr1zJ5LO6bzOrx+shDFo++LasYPT5vkgtgj+KySUnNySxLLdK3S+DKeHK0nblgPXfFzPk3
        mRoYb3N0MXJySAiYSDS032DuYuTiEBJYwShx/dJ8FgjnC6PE4+6jbBDOZ0aJL+vXs8O0vLx8
        ECqxnFHi7+fTjHAtU5sPsoJUsQlYSUxsXwWWEBHYzSjx8/lusC3MAhMYJfadmcAMUiUs4C1x
        o+kWE4jNIqAqsae7kw3E5hWwlZi24BLUPnmJrd8+sULEBSVOznzCAmIzA8Wbt84GGyohMI9d
        4uW0+8wQDS4SV48th7KFJV4d3wI1SEbi/875TBAN64AO73gB1b2dUWL55H9sEFXWEnfO/QKy
        OYBWaEqs36UPEXaUaOk9CBaWEOCTuPFWEOIIPolJ26YzQ4R5JTrahCCq1SQ2LNvABrO2a+dK
        qHM8JP5dmA8WFxKIlZh4/injBEaFWUhem4XktVkINyxgZF7FKJ5aWpybnlpsnJdarlecmFtc
        mpeul5yfu4kRmKJO/zv+dQfjvj9JhxgFOBiVeHg/hCjECbEmlhVX5h5ilOBgVhLhPTlDNk6I
        NyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZqakFqUUwWSYOTqkGxu2sR0v/rbt9
        gOHFm2fq7NW3z1UpTiufd3PftG79eqFPUYfSVxQlsV/Z/fi/9ibDf882Plt/qvNu4bpZ9kof
        01xcJgjolkYnis2JrPR6qbXFvVshcp5tUQRXcp74p+aFVx7unFRUknfqtcWMT1ekDli0OPyx
        vKP27vay3C+xUvYrPxz4ZSoQ0KTEUpyRaKjFXFScCACDGjezTQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42I5/e/4XV37cIU4g/0zWCw2zljPavHkQDuj
        xZzzLSwWE098YrFY2LaExeLYjkdMFpd3zWGz6Ny0ldGi7/UxZotLe1QcuDy2rLzJ5LFpVSeb
        x9GVa5k8FvdNZvV4feQhi0ffllWMHp83yQWwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY
        6hkam8daGZkq6dvZpKTmZJalFunbJehlPDnazlywnrti5vybTA2Mtzm6GDk5JARMJF5ePsjW
        xcjFISSwlFHiad8y9i5GDqCEjMTx9WUQNcISf651QdV8YpTYsuMYE0iCTcBKYmL7KkaQhIjA
        fkaJyQsPMIE4zAJTGCVWnGkFqxIW8Ja40XQLzGYRUJXY093JBmLzCthKTFtwiR1ihbzE1m+f
        WCHighInZz5hAbGZgeLNW2czT2Dkm4UkNQtJagEj0ypGkdTS4tz03GJDveLE3OLSvHS95Pzc
        TYzAuNh27OfmHYyXNgYfYhTgYFTi4Z0RpBAnxJpYVlyZe4hRgoNZSYT35AzZOCHelMTKqtSi
        /Pii0pzU4kOMpkDHTmSWEk3OB8ZsXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC
        1CKYPiYOTqkGRsdWNe5117p1pdPn3zpsJ7c1tbz+8n3DowsuBchqr++xD1NobXsZ/3Vq0OnD
        Z+U/rf1p93VBAJ+rE1OHecm6ete7a8ReiTAeOvW3PH7lDY9Ol21v5gtLBGTbx2xyLKy8s93p
        Zf/24E0ebfZcQY93eaiuK1HX3PUrdQ7X/rfTPp4NvBEyjdejRImlOCPRUIu5qDgRADDN8euh
        AgAA
X-CMS-MailID: 20200116122951eucas1p1d36493f2b496bb13dca4fd1a17abad49
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200116122951eucas1p1d36493f2b496bb13dca4fd1a17abad49
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116122951eucas1p1d36493f2b496bb13dca4fd1a17abad49
References: <CGME20200116122951eucas1p1d36493f2b496bb13dca4fd1a17abad49@eucas1p1.samsung.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Commit 54ff4a1d1732 ("MIPS: Alchemy: pata_platform for DB1200")
from year 2014 converted the only user of au1xxx-ide IDE host
driver (MIPS Alchemy DB1200 platform) to use pata_platform libata
host driver instead. This patch series removes dead au1xxx-ide
driver code & co.

Since patch #2 depends on patch #1 (and it is also the best to
apply patch #3 after driver code removal) it would be probably
easiest to merge everything through MIPS tree (after getting
necessary ACKs, from David for the first patch and Jonathan for
the third one).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


Bartlomiej Zolnierkiewicz (3):
  ide: remove no longer used au1xxx-ide driver
  MIPS: Alchemy: remove no longer used au1xxx_ide.h header
  docs: mips: remove no longer needed au1xxx_ide.rst documentation

 Documentation/mips/au1xxx_ide.rst             | 130 ----
 Documentation/mips/index.rst                  |   2 -
 .../mips/include/asm/mach-au1x00/au1xxx_ide.h | 178 ------
 drivers/ide/Kconfig                           |  17 -
 drivers/ide/Makefile                          |   2 -
 drivers/ide/au1xxx-ide.c                      | 597 ------------------
 6 files changed, 926 deletions(-)
 delete mode 100644 Documentation/mips/au1xxx_ide.rst
 delete mode 100644 arch/mips/include/asm/mach-au1x00/au1xxx_ide.h
 delete mode 100644 drivers/ide/au1xxx-ide.c

-- 
2.24.1

