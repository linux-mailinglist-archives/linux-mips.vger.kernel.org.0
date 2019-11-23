Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501FF107FF8
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 19:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfKWSay (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Nov 2019 13:30:54 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25778 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbfKWSay (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Nov 2019 13:30:54 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574533844; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=b658i1K/XsIfArfFVNPTkQQPieWkfJA7KoUr/lsTolYA8V1ysO9qCR+plLbzXa6kRZBH7m5NExwrmgbnkWrxF4go7uENDsJ4yH3NMKvkRjR1WG/07HLh8Gs5xEYW7o1Fbk0+HywI+g6AYgfi2lhmgOCiy1UzO3hXA9sMaMJwkcE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574533844; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=H94x1tfJHQJNFBM0ErsvL0Uudwa/ZEgpUH9VtK3qs9s=; 
        b=j0Td24ohUXjpF12sp/y6CccAi8BB7oVaDYIo4hIUVHs4hN7cax6DdGdAdgNBT8jj1535PQkVlQ7TydwjSSn2flB51ZgTW+TVSDyhjvjutSYqhkJcj7p+KCk7POuD3W+b9UFQs5Tpz3+zz2tbaK1O7uh1OAqCtORC0DZOew0yZkM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=HCSckvSqpbedPMJ/vK1nm9Hq5WkNXEukP+l3R7/vh/bjFD5GomuvuDpxfLRuhM70A9mtIQIu6Ic1
    GVw7WBOYFt8Xo9QnQ1M0OYbH/iF7KcszodwwY2PTpNnILFsJTJCk  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574533844;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=H94x1tfJHQJNFBM0ErsvL0Uudwa/ZEgpUH9VtK3qs9s=;
        b=bWyTKfoxNrKbA3csh4dH/67cvyi2JTjcXXnHSOUtZeI/sNjUq9Y4I5lMhOEqO+9k
        LFuwGu1tKw9aX61yXQGCNpGhLY/0TVa6a+spwooe4BOEWOrHjzCRjD25Z3EP5GkPCTl
        Wi6Op5I8oqNZfan6gBOQJqNekaN37mJa0U4fMqyA=
Received: from localhost.localdomain (171.221.112.247 [171.221.112.247]) by mx.zohomail.com
        with SMTPS id 157453384281543.77998308884901; Sat, 23 Nov 2019 10:30:42 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, mark.rutland@arm.com,
        linus.walleij@linaro.org, paul@crapouillou.net
Subject: Fix bugs in X1000/X1500 and add X1830 pinctrl driver v4.
Date:   Sun, 24 Nov 2019 02:30:02 +0800
Message-Id: <1574533806-112333-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v3->v4:
1.Use local variables to streamline code.
2.Prevents processors older than X1830 from being
  configured in HiZ mode.


