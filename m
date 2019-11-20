Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5938A103CC2
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2019 14:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731415AbfKTN7n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Nov 2019 08:59:43 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25838 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbfKTN7n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Nov 2019 08:59:43 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574258368; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Y6WRYknZsUKbQLwTu5XUuI52Ku0yUyoG6Hq9p3REeEgtun8xfD+pfmO3e5CX0WrL9Xc48piQ2qpWWtbz7CThX8xcJsTWpTC2qyHnrLlfYttvyySoEYOCo0a2ieDw6TTo6dGZeSTBBtvS7HGO7/dlK2otM6kDLpixJ8Lo4jO38jI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574258368; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=BMd11sUm3Vb7RqpzmUpYZqHHHjwC583kFBMHToid0uw=; 
        b=Enw6BI1aCY3s4gE9yXtXz6SS6OnqWrKp+3Uct9FdrhoN4Z8r4gXUYH32OhSpjh6IagdF+OFldbntMas9C4r/niX+wJggI57+VnsbwHdbWicwLwnZlfun2y8NuqqxHDekpEAacYx4LgTq2Zd3ZklvjwEFh7ZSPpbfP1LGiAlJkC8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=TaUzcbnUZ2ZyvAVTilwzXwflY/cKoHREvMIzjSu0b/dHF1FPGNQw9AfwfUjW4ihdAccpJnEZs2m3
    Yi4Jf+fi4tlcrtYtS0BmQn4o8i8etiUI+qWWH48e6W+GMyTzc9V1  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574258368;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=351;
        bh=BMd11sUm3Vb7RqpzmUpYZqHHHjwC583kFBMHToid0uw=;
        b=oMudlXZ9C4jUQnQrf5qvBNwsQi81hcNLd6upgcIHnQztQzLH6ZTjgDdsFkPxfJEI
        GiosYX5cDEd/Dsn1jJsOq9PBWdccsicK4PU3uPFTdTuZkOmNHpuCFn1lhC5bdMI3+Aa
        gTGKTDYex6Cj/Kv27w1kLx6kJRGSYJ7WHZvjZS0k=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.112.99 [171.221.112.99]) by mx.zohomail.com
        with SMTPS id 1574258366149382.2353680349329; Wed, 20 Nov 2019 05:59:26 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paulburton@kernel.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org
Subject: Fix bugs in X1000/X1500 and add X1830 pinctrl driver v2.
Date:   Wed, 20 Nov 2019 21:58:59 +0800
Message-Id: <1574258343-122458-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573804011-2176-1-git-send-email-zhouyanjie@zoho.com>
References: <1573804011-2176-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.Modify "nemc_" to "emc_" because X1000 has only one regular externel
  memory controller that does not support nand flash.
2.Add pinctrl drivers for the SPI flash controller (SFC) of X1000
  and X1500.
3.Add pinctrl driver for the synchronous serial interface (SSI)
  of X1000.
4.Add pinctrl bindings and pinctrl drivers for X1830 SoC.


