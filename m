Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B810D67DEA
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2019 09:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbfGNHKY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jul 2019 03:10:24 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25441 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfGNHKX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jul 2019 03:10:23 -0400
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Jul 2019 03:10:23 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1563087314; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=fq+RnDot6x5kJXPhtqdUrcmvpJi+rOmYHxMgw/GrGEvVUZyrNwS7eWiwOG5bFQ4opCwT8j3Xe3BMdxY8OiUkRk2HWh6g6nPF+NM42qJuzKX4zfGkVasBgu7GzjoiZEmXI2DQFVWd8YSeE56RHvueEGYV32DTyOuOKHNGJPfbyKA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563087314; h=Cc:Date:From:Message-ID:Subject:To:ARC-Authentication-Results; 
        bh=dap8Y72S8MEX1dN70PilFr+OT6q7HUeUr6hJgltxjnI=; 
        b=cGX7HXUguub9xmXQb0I8PCxPsAp8AEYsiYFKUSACtk6e2D9dUoecIJK20SbEAKnUBZMrcySRbMJCel1gP5J996wSQw2MIQrQVLBc4dJW9DL5O1tLYucXalBqjfChAHJgAQEm8VuWlNGxsgZGwSeQCP4+4jUNz5HLkfCVLOcHThQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=tegzVwXMLT0Z60NuO4b6/OXILmE/b2gFr0ahyExNkAudpwBbXUZI+hZK9WHnhukICoTkG0ze0kpi
    FDtiYtxH4/WGuxKGHObqyKqvbYEiked9fEC+xCTOgVgA1uNqnvmI  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563087314;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id; l=67;
        bh=dap8Y72S8MEX1dN70PilFr+OT6q7HUeUr6hJgltxjnI=;
        b=GtVfNYa10md6aikIV3Q9CqDtVxYHC1oysDRX7SOPuCkA9z3zwmqvPOhuMtyavo90
        G0T6M5aVFPpKIKIJ0sE0fNN+55wBFlvZ58SnDO2eE03eKyMl7yPAUGzSzOTEIDxVMqg
        9vNsw4dnEt+jw/mF6GDWpfz86Jjwef+0/OCac5IU=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1563087313043102.86025457876679; Sat, 13 Jul 2019 23:55:13 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: Ingenic pinctrl patchs.
Date:   Sun, 14 Jul 2019 11:53:50 +0800
Message-Id: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for Ingenic JZ4760, JZ4760B, X1000, X1000E and X1500.


