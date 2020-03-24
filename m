Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B30A2190C1E
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 12:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgCXLOl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 07:14:41 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43098 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727256AbgCXLOl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 07:14:41 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200324111438euoutp015a93ce53955c4b6381114675fde9cd1f~-OTFn8Zqx0249402494euoutp01a
        for <linux-mips@vger.kernel.org>; Tue, 24 Mar 2020 11:14:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200324111438euoutp015a93ce53955c4b6381114675fde9cd1f~-OTFn8Zqx0249402494euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585048478;
        bh=4Ipof9r/d5t6lCf7L27jo1b5FaNLzhn50JEXNBKKV3s=;
        h=From:To:Cc:Subject:Date:References:From;
        b=DD6H9WxKVjdBSTIBtzIjuTZ5Smr6kzb5oHRyUu5ThK1TZgPcjlC43U+cAKHWgoz5r
         kvhAW4qvVtgmkZ6+T/6UfVcy3QIPn7rzhzyoeKkYxtMwJUTBgFkwi++LvL4PFJR5Ew
         mf+fHeOPWdyUUWWyFVuAxJYzWB84ApUEgiggHn6w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200324111437eucas1p1a0624677971437b0684aebeb4a567163~-OTFTGhV-1901819018eucas1p1e;
        Tue, 24 Mar 2020 11:14:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CA.1D.61286.D9BE97E5; Tue, 24
        Mar 2020 11:14:37 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200324111437eucas1p1a898c365a825deb9d0dc6c99202e2f57~-OTE8sEcY2111821118eucas1p1M;
        Tue, 24 Mar 2020 11:14:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200324111437eusmtrp26711795f1c51421d52348f6df73d621a~-OTE8AAAx0446404464eusmtrp2l;
        Tue, 24 Mar 2020 11:14:37 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-10-5e79eb9d2bbd
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 75.BE.07950.D9BE97E5; Tue, 24
        Mar 2020 11:14:37 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200324111436eusmtip1cedec3205fd652355a66a8eafd7eddcf~-OTEZ9ROp0080400804eusmtip1m;
        Tue, 24 Mar 2020 11:14:36 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com
Subject: [PATCH v2 0/3] ide/MIPS/docs: remove no longer used au1xxx-ide
 driver
Date:   Tue, 24 Mar 2020 12:14:17 +0100
Message-Id: <20200324111420.31793-1-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsWy7djPc7pzX1fGGex7qmexccZ6VosnB9oZ
        Leacb2GxWLn6KJPFxBOfWCwWti1hsTi24xGTxeVdc9gsOjdtZbS49uURu0Xf62PMFpf2qFgc
        bjrI7MDr0XppOYvHlpU3mTx2zrrL7rFpVSebx9GVa5k8dt9sYPNY3DeZ1eP1kYcsHn1bVjF6
        fN4kF8AVxWWTkpqTWZZapG+XwJVxaekJ9oIXXBVff7QyNzCu4+hi5OSQEDCRWLlmG1sXIxeH
        kMAKRonP39tYIZwvjBLTdl5hA6kSEvjMKPH3XBxMx9rLB5kgipYzSvyeNIkZrmNLw20WkCo2
        ASuJie2rGEFsEQFjifVbd4ONZRaYwiyx/cw8sCJhgQCJtcs6gbo5OFgEVCUev/EGCfMK2ErM
        /bKdGWKbvMTWb59YIeKCEidnPgFrZQaKN2+dDbZYQuAUu8TxJZ8ZIRpcJD7sussKYQtLvDq+
        hR3ClpH4v3M+E0TDOqB3Ol5AdW9nlFg++R8bRJW1xJ1zv9hALmIW0JRYv0sfIuwoMW3HCxaQ
        sIQAn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0msWHZBjaYtV07V0L94iHRceUpOyREYyWub2hl
        mcCoMAvJa7OQvDYL4YYFjMyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxAhPb6X/HP+1g
        /Hop6RCjAAejEg+vxsPKOCHWxLLiytxDjBIczEoivJtTK+KEeFMSK6tSi/Lji0pzUosPMUpz
        sCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYOx88mtjzGTNBYzJjJ61/653696d5/Iq8H3S
        OZFbmy55zsoxD+Te8GLW8YhXklNl5i0rYZHZHmmcbLJOvVfBe0Mo98rVAa/eMbZP2vyJ58Ib
        F+X+zyp7tCtzFff4bBA/ZSkmn6YqI86wIfOurmzqi/VBJy+7zOP/V6NZtj/ZuFLi3tYgDUcz
        ZSWW4oxEQy3mouJEAFZ6B61oAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7pzX1fGGexcLm2xccZ6VosnB9oZ
        Leacb2GxWLn6KJPFxBOfWCwWti1hsTi24xGTxeVdc9gsOjdtZbS49uURu0Xf62PMFpf2qFgc
        bjrI7MDr0XppOYvHlpU3mTx2zrrL7rFpVSebx9GVa5k8dt9sYPNY3DeZ1eP1kYcsHn1bVjF6
        fN4kF8AVpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+X
        oJdxaekJ9oIXXBVff7QyNzCu4+hi5OSQEDCRWHv5IFMXIxeHkMBSRomXSxazdDFyACVkJI6v
        L4OoEZb4c62LDaLmE6NE8+uzzCAJNgEriYntqxhBbBEBY4n1W3ezghQxC8xjlrjx4jITSEJY
        wE9i0pR2ZpChLAKqEo/feIOEeQVsJeZ+2c4MsUBeYuu3T6wQcUGJkzOfsIDYzEDx5q2zmScw
        8s1CkpqFJLWAkWkVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYDxtO/Zzyw7GrnfBhxgFOBiV
        eHg1HlbGCbEmlhVX5h5ilOBgVhLh3ZxaESfEm5JYWZValB9fVJqTWnyI0RTo1onMUqLJ+cBY
        zyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwNgfduiV5/e7FdKy
        oqYpc2LUOH8Kvfp7fbXYF+XPn3U5UnzbGK4bOB5yE+jeJhtyoKqw0vbNtcpTt24782WLtkpu
        uTSnb94ziw/2M6QE/fJ7vP/ULNm+qlqmv8qa9ZCz7v/Ju3tY9Zw/57fb++pdjziyu3qpbUK0
        QsCpiB25OYtereI65vCnVImlOCPRUIu5qDgRANVqptq9AgAA
X-CMS-MailID: 20200324111437eucas1p1a898c365a825deb9d0dc6c99202e2f57
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200324111437eucas1p1a898c365a825deb9d0dc6c99202e2f57
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324111437eucas1p1a898c365a825deb9d0dc6c99202e2f57
References: <CGME20200324111437eucas1p1a898c365a825deb9d0dc6c99202e2f57@eucas1p1.samsung.com>
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

Please merge through mips tree (IDE changes have been Acked by
David Miller).

Changes since v1
(https://lore.kernel.org/linux-ide/20200116122938.20789-1-b.zolnierkie@samsung.com/):
- added ACKs

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

