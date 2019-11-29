Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB7710D299
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 09:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfK2IuC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 03:50:02 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25897 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2IuC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 03:50:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1575017364; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=dxV8WAwivGXjeWfqioCPaV4jG3GTTSpwBTv/BbIpekDWCiwyHOxsmz56Ukrrlwgf53oqp9F13uT/AmZl7keYL33mHTvpIBDPV81Ykp3gJ2RVq5hSIhrX/3Ze5VA8cSsOkKDdPmPZf+iWtPUn5A/vXUzkEJjFI/1TPzopWvGsKPw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1575017364; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=XqQQbl9IG+MgujWf5gYJVBmWox/39o+UThQ2/GDWy54=; 
        b=ni+NF8Jh5cIkiRbM0Zm7bhZtQuIDChIeU/HuooO+cs+1vsHHFTYsuNA0QUzxSy6fSbZhpVlIg8X8fSMm7gYWGs9IX89Rcv6sKNsUBLBqoZ/Z/DTlt+gFT8MOGlwszDkhDAGudO8I/nCj6HJLHMIcOxnuO67EpVEx8z8P32TVmXc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=lwfOQwEp8AWBdSh73JAwYTYipV3+ABcfW/bNiCa/hzwbnyZMmrn5sVU2vSvp8cKB3STUMdMPhMbo
    CHlrqZxuc+jhbPZxj6c5494eCb2uOspa0mjeh291JlfPf8n8p7r1  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1575017364;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=XqQQbl9IG+MgujWf5gYJVBmWox/39o+UThQ2/GDWy54=;
        b=VDiGucZvO2jj9hBFgl6PeFHut4+xry2kWHknH1N902DZvAUYd/TuYB2gQPEky6fe
        tmSZwnA55E2GKdyYNbjeVrDNcR5z2fhJ3sTE1CvvkpSQph33F0zd3HwVg7NJxfn206m
        xyecWPuk5QWUFF5AEpUz43jeBMOnxqwgzvfuW5Z8=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.146.46 [139.207.146.46]) by mx.zohomail.com
        with SMTPS id 1575017363957466.0876378330212; Fri, 29 Nov 2019 00:49:23 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: Add initial support for Ingenic X1000 SoC and Y&A CU Neo board v6.
Date:   Fri, 29 Nov 2019 16:48:41 +0800
Message-Id: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v5->v6:
1.Use "stdout-path = "serial2:115200n8"" instead "stdout-path = &uart2" in DT.
2.Remove "console=ttyS2,115200n8" and "CONFIG_CMDLINE_OVERRIDE=y" from defconfg.
3.Add watchdog timer DT node, and update defconfig for watchdog timer.


