Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 563181072D4
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 14:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfKVNMl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 08:12:41 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25807 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfKVNMl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 08:12:41 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574428321; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=kXd034TIQaHU8q5Z9RaChiOV3nfYEP+BRIui1s097bPR3yUgNy2oYd6Mp48VuykZwM6YueJwv7WUwPrQlkV917aDIyo9owkdICRgHc/FY0HjsimwVcKmIvOdBY5VN68US77OxMv/41DOaDhUn6vBB0fr+p03GFyp/gMQBC6aqbI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574428321; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=3k8n1wUP9S+tbwonD1mKdaIoh62Cp2a7k9cLT1jSdLU=; 
        b=DxLlvajyOTtVnIBIe7egK8ynsEAE4PJ5zSpdmq5DoHO9TtI9qG6JzGSUed84pbzbSaCLa+6ajjFfpTOive1VuRmFhvKuKK4YiQvtHzxNAWgHdKRndcgjqYRMh8BYMoy+bMKa9Z03Je06mrH53BD16uDJQTqOG2mOQpUMsb+oDtw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=Zne0x3Qn13Cih71veGzT+QhV4oqOr1NClKfPTfFKoFjEKZM4JV672MXOUN9BAgR8H0s4+Sf4lBAV
    eVVuyw/no54QNGUm5Qaxlgts0aijw2GoKSlJwPCJCaDvj4paAX93  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574428321;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=3k8n1wUP9S+tbwonD1mKdaIoh62Cp2a7k9cLT1jSdLU=;
        b=e0mDePS9BwrzvC9OPQxZQmaTiuiAOx866LE2zThi6H9QoUCO8Hdyq0EOMiaV/tx4
        X/tTVlb6dh9bP2rrnwsELjbb72rY/tghaz9qH79lXMdgvBz37OOqmzsunCkor/99srQ
        Vk1Ta5+/6Pi0fG4pA1sUHW4A80aIHIS/958lHlv0=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.83.158 [171.221.83.158]) by mx.zohomail.com
        with SMTPS id 1574428319331480.9765713082338; Fri, 22 Nov 2019 05:11:59 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com
Subject: Add initial support for Ingenic X1000 SoC and Y&A CU Neo board.
Date:   Fri, 22 Nov 2019 21:11:25 +0800
Message-Id: <1574428289-21764-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add initial Ingenic X1000 SoC support. Provide minimum necessary
  information to boot kernel to an initramfs userspace.
2.CU Neo is a development board using Ingenic X1000/X1000E SoC. It
  comes with either 32MiB/64MiB of RAM. Add initial support for
  CU Neo development board.


