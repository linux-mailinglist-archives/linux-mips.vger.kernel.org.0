Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33A15107C76
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 03:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfKWCeg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 21:34:36 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25889 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfKWCeg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 21:34:36 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574476438; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=g3lmfCqx3I2xWKQYAwHkZXCzXGzvyxZqzNzU7RymwUAnzIXNsmmKFb7E/wN1Mmi90vVkYmvQH0XeJCVpB71CEGBoUZqEpqdfFg93I/AcSs/i1NDz4I5AQJ6B4eoNg1HWvUqkdNn3V9Ro9vRLtfNPWsHX5FlSbWRRshWoephcIpI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574476438; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=dCM44G4kUl5QOVe/uw5T8hO9Qh8KnzxxvZE4pOJAobM=; 
        b=QRNq+v839lkg/hwt0s+Ul04xb+merU4Ka4ixGGzuqhqWJ1UlnvQBQrcWmW/xPac0/MKcFK/ySx4qJZOCyjVVQokIFe4l3KVSCyY+uj2Asp4ydAEhk3VxmCEm/GIb7yo4s8qwwGA0OPCJVmUytHaN+6jnXeikL2d1i19xy8zv4jU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=otKbVOYI3dSiLZQ6dLS4BO1UXGkeoKXDofCo8ki18HiPhhr4sOjsVdnD2hF9p/pvrBDAxCEexe31
    nQTTh7rtAYYUhY9gjK/vPUtSqoUzwOSiCCgBZJXpelwT11jmK9Km  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574476438;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=dCM44G4kUl5QOVe/uw5T8hO9Qh8KnzxxvZE4pOJAobM=;
        b=UHL82Wu7NsaWKU/egoA2Rt4qtmZnz0zaAvr3jbxwsJpRi7aIfPg8nTtfI5ERIEi+
        NxlPK/jbVC1oUaDfoftTHVE+opws2b14grStdUvDOPUjRrsvJ6WmNjaoXyNYKiLIiRT
        cL3f6ZcGdPaeKTLW8M5KqXWx0scDXsyhLPlDPgk8=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.48.217 [182.148.48.217]) by mx.zohomail.com
        with SMTPS id 1574476437253956.326840571938; Fri, 22 Nov 2019 18:33:57 -0800 (PST)
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
Subject: Add initial support for Ingenic X1000 SoC and Y&A CU Neo board v2.
Date:   Sat, 23 Nov 2019 10:32:20 +0800
Message-Id: <1574476344-62631-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
Rebase on top of mips-next, use ingenic-timer driver
for system timer and clocksource.


