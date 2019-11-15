Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF86FD74D
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2019 08:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfKOHr2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Nov 2019 02:47:28 -0500
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25410 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOHr2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Nov 2019 02:47:28 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573804039; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=RkD1wjSMYuglEclXubH6+ki/IFE6TU5X1zcTUc7mW5DmUJmIaJk0FmWkE7X3sQSUzBDky4fOUvsYlrGED6plYDFeXpaHk8eEDBRwVkk8zMZaoK72ITtNr5K+Dfs512DpN3zkDspq6yADy1WRy1dwhCFXSPTtq1XKLFfdWC5/KW8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1573804039; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=QljwlDhpzIWWDLQ1rPZdvPj7kPoH65XoXCVpfyB3Qvc=; 
        b=aVDzIeAzlfDs9fH6mRhnF2JKzBL8M+fi6ZCos7sDD5ijeC++UJTyOymBxKKyEQd/1WvB5EkQ79VWwo3qtfP/dIZoR+QTYDWlXeYVDmy6oJdLLpIG0xNafMgSqoUOM6VON080wgeK/4zdDqx5D1fykzPkoy69SvG/vo8ffkHgs5I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=d475j8PU33xsZChp/64FWfUoSqM7Ru19uVzghf7ToDDSv5+2sfG1rsWyXcUAXNeZrHNCWddCPgT6
    WAaxkJ/rapMmRd7GrLPUicBKPcsY1mQieiinmMb1nh7XkPtwwiG3  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573804039;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id; l=89;
        bh=QljwlDhpzIWWDLQ1rPZdvPj7kPoH65XoXCVpfyB3Qvc=;
        b=kKGzGUxuakKxrlAiHj0s+bSVqWhI2HbbB4PkLWF+trUSvkoJfq1yp/WcMgIelv+I
        5JeAuJ1Fw6RJqayUF11ygINXUlVlqAGDVVBXPzdMuofIYAYVpqyX7NlnBNuGNcPsEdu
        MhDIsqRhC7WrrAIxvxV8/Ply1swP74o3Cvs4QYt0=
Received: from zhouyanjie-virtual-machine.lan (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1573804037679489.1531984968743; Thu, 14 Nov 2019 23:47:17 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, paul@crapouillou.net,
        paul.burton@mips.com
Subject: Fix bugs in X1000 and X1500 pinctrl drivers.
Date:   Fri, 15 Nov 2019 15:46:50 +0800
Message-Id: <1573804011-2176-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the wrong configuration of pull-up and pull-down,
adjust some unreasonable naming.

