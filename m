Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4964810A913
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 04:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfK0Dds (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 22:33:48 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25885 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfK0Dds (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 22:33:48 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574825608; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=MurykgZIXLdz+OUVTTOoPhnDFLLScP3XNvDuJ3lHVW/19v66/AKi9bLhrJVKDwV4HWze35Hj/g6Jmd3F35joRsIgFZAO4k2x22SuxOT9VXZlECoxvaT7M8V2OqEx69OVxd4WsD24kPmZ/kOHbCKcm/8ZuD7U/cx4ZZk+JXcEshI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574825608; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=TuRbAqCJtixX3GUqtL+gHnjT/Sm9uZHarcGIf7Ov5ZE=; 
        b=ViHteWGIlE3+rTYb+Db0Lh6GJ54YF6oIEzBdOw3KWNWbh+5q6ICqSdUWBTiTrk0g+l09VtrCs8tBAu5GKT1czYdV0XPoR63AIksbl/0liOVGi9q0MrxOjjbww+P5WJCncquFXQXgfaJ/6kLsRln+oYOo0vf7K9FLpVZUBpiI3+E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=A9HeLtKq2ekABrRsofmQJ++RrJDZJYOc4R5TMfDxofQ1wbhpLgzke4a32YDZX3IA5l77hOa8cFYY
    BX2CEN2Rzue0nTSSLdMDxw6EL4yhaBmZ98GMVuHiDMJ5VAf2LkGM  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574825608;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=TuRbAqCJtixX3GUqtL+gHnjT/Sm9uZHarcGIf7Ov5ZE=;
        b=C7LeFy5ZPg9NqLr+7PRUK8EOgHagcP9opkaiwwjVPPvJkVa6n3XLLCo3+EHBl68m
        MwhH0MMIl2Y+3L0wj24+utLkLufQrRwnsInXRWqiJTgzGFp111bPV7YC/5Sa0IuheW1
        uu270LUmhO5BfzmJO3CJLXSS1Qq+H5k6bTRWz0co=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.174.158 [139.207.174.158]) by mx.zohomail.com
        with SMTPS id 1574825607870597.1454791514287; Tue, 26 Nov 2019 19:33:27 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: clk: Ingenic: Add support for the X1830 and add USB clk for X1000.
Date:   Wed, 27 Nov 2019 11:32:51 +0800
Message-Id: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Adjust existing code to make it compatible with Ingenic X1830 SoC.
2.Add support for the clocks provided by the CGU in the Ingenic X1830
  SoC, making use of the cgu code to do the heavy lifting.
3.Add USB related clock for the Ingenic X1000 SoC, and use the
  "CLK_OF_DECLARE_DRIVER" instead "CLK_OF_DECLARE" like the
  other CGU drivers.


