Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50B2ED4D1F
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbfJLFOy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:14:54 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25488 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbfJLFOy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:14:54 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570857256; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=GrNQpEMLZsHG5+GY5yRGD8ynZ4VGkAbutmOs13E/62bwdXdIeHn2OpU2ZmbcQ1cx6Iy/92q6OnZeKuTWb/8nlsdtgQCfK9Vf+ZanXKq8SDk91p7ak0XM7rAmpE2D96S34URKCxhyu1nbP1phbEzv9bfEKO+/DCE4YPF7OSjG8Pk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570857256; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=iCPDNrV6/YQoHj9l6MIIWc8hHGpQol2xBLbHcVZa9EA=; 
        b=I3zYDSdGl56BmmQ23GraX856Y0mqgtLgM+j5G7748oBJGKo0uL7lnF6GVe13JwVKZAZ/2p9yawdjTQwwINNPTabDW9TRaGlSxTa0mPLRid2KFmJZZtHWShlg//OEn7QiTnpCCYlATsOnIhrZ8RSYcT+97NfDcUIxka4lW+3w/iE=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=O2Un9YsZx8k62f/NS4lXeTs30Os0d4S7QXwbnZue5kYPl5efEP5JwoRCVQugQCNFknih+J1ux15O
    wUzmdV5WTPPkNGTjWexuemHf78IDTAO5CLpzUidUZRAPgHt555Km  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570857256;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=75;
        bh=iCPDNrV6/YQoHj9l6MIIWc8hHGpQol2xBLbHcVZa9EA=;
        b=ZgOSUAzFsts2rnHCIMsuCTxtHKn5UJR4KmhRvSVzwt61Y+VmzIAwddgqGTxAEbjp
        TP06ppH9s7yq6/u4mlfBw5ISHkrvnxg6CbpiqMVsaWpIE9Xlrk4KVQbJmha4/rkgDFz
        8hTbVQDcZEo0O1TSwNFGaY6KrzCJLsvGq/R3NpKU=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570857254571857.8144339815013; Fri, 11 Oct 2019 22:14:14 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, mark.rutland@arm.com, syq@debian.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        armijn@tjaldur.nl, tglx@linutronix.de, yuehaibing@huawei.com,
        malat@debian.org, ezequiel@collabora.com, paul@crapouillou.net
Subject: MMC: JZ4740: Add support for 8bit mode and LPM and JZ4760 Soc v2
Date:   Sat, 12 Oct 2019 13:13:14 +0800
Message-Id: <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2: drop macro definition rename, split patch, add support for x1000.


